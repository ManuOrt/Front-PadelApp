import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/general_widgets/dropfiled_widget.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController? username;
  TextEditingController? email;
  TextEditingController? userImg;
  TextEditingController? phoneNumber;
  TextEditingController? gender;
  TextEditingController? address;
  TextEditingController? birthDate;
  final ImagePicker _picker = ImagePicker();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (id == null) {
      final UserModel? user = Provider.of<UsersProvider>(context).user;
      id = TextEditingController(text: user?.id.toString() ?? '');
      name = TextEditingController(text: user?.name ?? '');
      surname = TextEditingController(text: user?.surname ?? '');
      username = TextEditingController(text: user?.username ?? '');
      email = TextEditingController(text: user?.email ?? '');
      userImg = TextEditingController(text: user?.userImg ?? '');
      phoneNumber = TextEditingController(text: user?.phoneNumber ?? '');
      gender = TextEditingController(text: user?.gender ?? '');
      address = TextEditingController(text: user?.address ?? '');
      birthDate = TextEditingController(
          text: user?.dateOfBirth.toString().substring(0, 10) ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
          padding: EdgeInsets.all(size.aspectRatio * 30),
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
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return SafeArea(
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(
                                    Icons.photo_library,
                                    color: AppColors.primaryGray,
                                  ),
                                  title: const Text('Elegir de la galería'),
                                  onTap: () {
                                    pickImage(ImageSource.gallery);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.photo_camera,
                                      color: AppColors.primaryGray),
                                  title: const Text('Sacarse una foto'),
                                  onTap: () {
                                    pickImage(ImageSource.camera);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.delete,
                                      color: AppColors.primaryRed),
                                  title: const Text(
                                    'Eliminar foto',
                                    style:
                                        TextStyle(color: AppColors.primaryRed),
                                  ),
                                  onTap: () {
                                    setState(
                                      () {
                                        userImg!.text = '';
                                      },
                                    );
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
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
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.2,
                    child: const Text(
                      'Nombre',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      withSize: size.width * 0.4,
                      controller: name!,
                      border: InputBorder.none,
                      focusBorder: InputBorder.none,
                      keyboardType: TextInputType.text,
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
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.2,
                    child: const Text(
                      'Username',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      withSize: size.width * 0.87,
                      controller: username!,
                      focusBorder: InputBorder.none,
                      border: InputBorder.none,
                      keyboardType: TextInputType.text,
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
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.2,
                    child: const Text(
                      'Teléfono',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      withSize: size.width * 0.87,
                      controller: phoneNumber!,
                      focusBorder: InputBorder.none,
                      border: InputBorder.none,
                      keyboardType: TextInputType.phone,
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: AppColors.primaryGray,
                      ),
                      hintStyle: const TextStyle(
                        color: AppColors.primary,
                      ),
                      labelStyle: const TextStyle(
                        color: AppColors.primary,
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
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.2,
                    child: const Text(
                      'Género',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Expanded(
                    child: DropFieldWidget(
                      withSize: size.width * 0.87,
                      heightSize: size.height * 0.06,
                      focusBorder: InputBorder.none,
                      border: InputBorder.none,
                      dropdownValue:
                          gender!.text == 'M' ? 'Masculino' : 'Femenino',
                      labelStyle: const TextStyle(
                        color: AppColors.primary,
                      ),
                      items: const ['Masculino', 'Femenino'],
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.primaryGray,
                      ),
                      onChanged: (String? value) {
                        if (value == 'Masculino') {
                          value = 'M';
                        } else {
                          value = 'F';
                        }
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
                  SizedBox(
                    width: size.width * 0.2,
                    child: const Text(
                      'Email',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      withSize: size.width * 0.87,
                      controller: email!,
                      border: InputBorder.none,
                      keyboardType: TextInputType.emailAddress,
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
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.2,
                    child: const Text(
                      'Dirección',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      withSize: size.width * 0.87,
                      controller: address!,
                      keyboardType: TextInputType.streetAddress,
                      border: InputBorder.none,
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
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.2,
                    child: const Text(
                      'Fecha de nacimiento',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      withSize: size.width * 0.87,
                      controller: birthDate!,
                      keyboardType: TextInputType.datetime,
                      border: InputBorder.none,
                      focusBorder: InputBorder.none,
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
              SizedBox(height: size.height * 0.02),
              ElevatedButton(
                onPressed: () {
                  final UserModel? currentUser = usersProvider.user;

                  if (currentUser != null) {
                    final updatedUser = currentUser.copyWith(
                      id: int.parse(id!.text),
                      name: name!.text,
                      email: email!.text,
                      userImg: userImg!.text,
                      phoneNumber: phoneNumber!.text,
                      gender: gender!.text,
                      address: address!.text,
                      dateOfBirth: DateTime.parse(birthDate!.text),
                    );
                    usersProvider.updateUser(
                        updatedUser, authProvider.getToken()!);
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

  Future<void> pickImage(ImageSource source) async {
    final XFile? photo = await _picker.pickImage(source: source);

    if (photo != null) {
      setState(
        () {
          userImg?.text = photo.toString();
        },
      );
    }
  }
}
