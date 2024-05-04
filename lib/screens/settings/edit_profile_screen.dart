import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController? id;
  TextEditingController? name;
  TextEditingController? surname;
  TextEditingController? email;
  TextEditingController? userImg;
  TextEditingController? phoneNumber;
  TextEditingController? gender;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (id == null) {
      final UserModel? user = Provider.of<UsersProvider>(context).user;
      id = TextEditingController(text: user?.id.toString() ?? '');
      name = TextEditingController(text: user?.name ?? '');
      surname = TextEditingController(text: user?.surname ?? '');
      email = TextEditingController(text: user?.email ?? '');
      userImg = TextEditingController(text: user?.userImg ?? '');
      phoneNumber = TextEditingController(text: user?.phoneNumber ?? '');
      gender = TextEditingController(text: user?.gender ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar perfil',
          style: TextStyle(color: AppColors.primaryWhite),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context, 'profile'),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: userImg!.text.isNotEmpty
                        ? Image.network(
                            userImg!.text,
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                            fit: BoxFit.cover,
                          )
                        : Image.asset('assets/img/default-image.jpg',
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                            fit: BoxFit.cover),
                  ),
                  SizedBox(height: size.height * 0.01),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      side:
                          const BorderSide(color: AppColors.primary, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.primaryWhite,
                    ),
                    child: const Text(
                      'Cambiar foto de perfil',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: AppColors.primary,
              ),
              Row(
                children: [
                  const Text('Nombre',
                      style: TextStyle(color: AppColors.primary)),
                  SizedBox(width: size.width * 0.03),
                  Expanded(
                    child: TextFieldWidget(
                      withSize: size.width * 0.4,
                      controller: name!,
                      hintStyle: const TextStyle(
                        color: AppColors.primary,
                      ),
                      labelStyle: const TextStyle(
                        color: AppColors.primary,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: AppColors.primaryGray,
                      ),
                      focusBorder: InputBorder.none,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'El campo no puede estar vacío';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                color: AppColors.primary,
              ),
              Row(
                children: [
                  const Text(
                    'Username',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Expanded(
                    child: TextFieldWidget(
                      withSize: size.width * 0.87,
                      controller: surname!,
                      focusBorder: InputBorder.none,
                      hintStyle: const TextStyle(
                        color: AppColors.primary,
                      ),
                      labelStyle: const TextStyle(
                        color: AppColors.primary,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: AppColors.primaryGray,
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'El campo no puede estar vacío';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                color: AppColors.primary,
              ),
              SizedBox(
                width: size.width * 0.87,
                child: Row(
                  children: [
                    const Text(
                      'Teléfono',
                      style: TextStyle(color: AppColors.primary),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: TextFieldWidget(
                        withSize: size.width * 0.87,
                        controller: phoneNumber!,
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: AppColors.primaryGray,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'El campo no puede estar vacío';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.primary,
              ),
              ElevatedButton(
                onPressed: () {
                  final UsersProvider usersProvider =
                      Provider.of<UsersProvider>(context, listen: false);
                  final UserModel? currentUser = usersProvider.user;

                  if (currentUser != null) {
                    final updatedUser = currentUser.copyWith(
                      id: int.parse(id!.text),
                      name: name!.text,
                      email: email!.text,
                      userImg: userImg!.text,
                    );
                    usersProvider.updateUser(updatedUser,
                        Provider.of<AuthProvider>(context).getToken()!);
                    Navigator.pop(context, 'profile');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Guardar cambios',
                  style: TextStyle(
                    color: AppColors.primaryWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterWidget(
        size: size,
      ),
    );
  }
}
