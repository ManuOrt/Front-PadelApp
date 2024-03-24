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
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? userImg;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (id == null) {
      final UserModel? user = Provider.of<UsersProvider>(context).user;
      id = TextEditingController(text: user?.id.toString() ?? '');
      name = TextEditingController(text: user?.name ?? '');
      email = TextEditingController(text: user?.email ?? '');
      password = TextEditingController(text: user?.password ?? '');
      userImg = TextEditingController(text: user?.userImg ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const HeaderScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, top: size.height * 0.02),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'profile');
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  const Text(
                    'Editar perfil',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    userImg!.text,
                    width: size.width * 0.5,
                    height: size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primary, width: 1),
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
            SizedBox(height: size.height * 0.02),
            TextFieldWidget(
              withSize: size.width * 0.87,
              controller: name!,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 126, 148, 163),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              style: const TextStyle(
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
            SizedBox(height: size.height * 0.01),
            TextFieldWidget(
              withSize: size.width * 0.87,
              controller: email!,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              style: const TextStyle(
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
            SizedBox(height: size.height * 0.01),
            PasswordTextFieldWidget(
              authProvider: Provider.of<AuthProvider>(context),
              withSize: size.width * 0.87,
              controller: password!,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              style: const TextStyle(
                color: AppColors.primary,
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'El campo no puede estar vacío';
                }
                return null;
              },
            ),
            SizedBox(height: size.height * 0.02),
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
                    password: password!.text,
                    userImg: userImg!.text,
                  );
                  usersProvider.updateUser(updatedUser);
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
    );
  }
}
