import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final InputBorder? focusBorder;
  final InputBorder? border;
  final TextInputType keyboardType;
  final double withSize;

  const TextFieldWidget({
    Key? key,
    this.hintText,
    this.labelText,
    required this.controller,
    required this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.labelStyle,
    this.border,
    this.focusBorder,
    required this.keyboardType,
    required this.withSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: withSize,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          hintText: hintText,
          filled: true,
          hintStyle: hintStyle,
          border: border,
          fillColor: AppColors.primaryWhite,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: focusBorder,
        ),
      ),
    );
  }
}
