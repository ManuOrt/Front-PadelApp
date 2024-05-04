import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double withSize;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final OutlineInputBorder? border;
  final InputBorder? focusBorder;
  final AuthProvider authProvider;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;

  const PasswordTextFieldWidget(
      {super.key,
      required this.controller,
      required this.withSize,
      this.hintStyle,
      this.labelStyle,
      this.border,
      this.focusBorder,
      required this.authProvider,
      this.hintText,
      this.labelText,
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
          labelText: labelText,
          labelStyle: labelStyle,
          hintText: hintText,
          hintStyle: hintStyle,
          border: border,
          focusedBorder: focusBorder,
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
