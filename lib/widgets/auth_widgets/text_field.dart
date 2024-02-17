import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? icon;

  const TextFieldWidget({
    Key? key,
    required this.text,
    required this.controller,
    required this.validator,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
            borderSide:
                const BorderSide(color: AppColors.primaryBlack, width: 10),
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
