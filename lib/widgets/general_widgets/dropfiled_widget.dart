import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class DropFieldWidget extends StatelessWidget {
  final Switch? switchWidget;
  final Icon? icon;
  final List<String>? items;
  final Function(String?)? onChanged;
  final String? dropdownValue;
  final String? labelText;
  final TextStyle? labelStyle;
  final InputBorder? border;
  final InputBorder? focusBorder;
  final double withSize;
  final double heightSize;

  const DropFieldWidget({
    super.key,
    this.switchWidget,
    this.labelText,
    this.icon,
    required this.items,
    this.onChanged,
    this.border,
    this.focusBorder,
    this.dropdownValue,
    required this.withSize,
    required this.heightSize,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: withSize,
      height: heightSize,
      child: DropdownButtonFormField<String>(
          value: dropdownValue,
          icon: icon,
          onChanged: onChanged,
          decoration: InputDecoration(
              labelText: labelText,
              labelStyle: labelStyle,
              filled: true,
              border: border,
              fillColor: AppColors.primaryWhite,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: focusBorder),
          items: items!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
            );
          }).toList()),
    );
  }
}
