import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextStyle? style;
  final OutlineInputBorder? border;
  final double withSize;

  const TextFieldWidget({
    Key? key,
    this.text,
    required this.controller,
    required this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.border,
    required this.withSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: withSize,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        decoration: InputDecoration(
          hintText: text,
          filled: true,
          hintStyle: style,
          border: border,
          fillColor: AppColors.primaryWhite,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
