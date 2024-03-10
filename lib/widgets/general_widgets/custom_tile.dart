import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    Key? key,
    required this.title,
    this.switchWidget,
    this.onChanged,
    this.onTap,
    this.leadingIcon,
    this.trealingIcon,
  }) : super(key: key);

  final String title;
  final Switch? switchWidget;
  final Icon? trealingIcon;
  final Function(bool)? onChanged;
  final VoidCallback? onTap;
  final Icon? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      trailing: switchWidget ?? trealingIcon,
      leading: leadingIcon,
      onTap: onTap,
      tileColor: Colors.grey[200],
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(color: AppColors.primary, width: 2.0),
      ),
    );
  }
}
