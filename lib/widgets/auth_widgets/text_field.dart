import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.size,
      required this.controller,
      required this.validator,
      required this.text,
      this.icon});

  final String text;
  final Size size;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.87,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 10),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: AppColors.primaryWhite,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
