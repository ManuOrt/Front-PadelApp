import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SearcherWidget extends StatelessWidget {
  const SearcherWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.width * 0.87,
        height: size.height * 0.07,
        child: TextField(
          style: const TextStyle(
            color: AppColors.primaryBlack,
          ),
          decoration: InputDecoration(
            hintText: 'Buscar',
            hintStyle: const TextStyle(
              color: AppColors.primaryBlack,
            ),
            prefixIcon: const Icon(Icons.search, color: AppColors.primaryBlack),
            suffixIcon: const Icon(
              Icons.filter_list,
              color: AppColors.primaryBlack,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: AppColors.secondaryWhite,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }
}
