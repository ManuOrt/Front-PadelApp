import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double withSize;
  final TextStyle? style;
  final OutlineInputBorder? border;
  final AuthProvider authProvider;
  final String? text;
  final String? Function(String?)? validator;

  const PasswordTextFieldWidget(
      {super.key,
      required this.controller,
      required this.withSize,
      this.style,
      this.border,
      required this.authProvider,
      this.text,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: withSize,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        obscureText: authProvider.password,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: style,
          border: border,
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
