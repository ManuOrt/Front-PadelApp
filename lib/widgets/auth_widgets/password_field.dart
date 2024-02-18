import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget(
      {super.key,
      required this.passwordController,
      required this.size,
      required this.authProvider,
      required this.text,
      this.validator});

  final TextEditingController passwordController;
  final Size size;
  final AuthProvider authProvider;
  final String text;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.87,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: passwordController,
        obscureText: authProvider.password,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(
            color: AppColors.primaryGray,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              authProvider.password
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppColors.primaryGray,
            ),
            onPressed: () {
              authProvider.updatePassword();
            },
          ),
          prefixIcon: const Icon(
            Icons.lock,
            color: AppColors.primaryGray,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
