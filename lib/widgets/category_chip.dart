import 'package:flutter/material.dart';
import '../utils/theme.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap(),
        selectedColor: AppColors.maroon,
        labelStyle: TextStyle(
          color: selected ? Colors.white : AppColors.black,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white,
        shape: StadiumBorder(side: BorderSide(color: AppColors.maroon.withOpacity(0.4))),
      ),
    );
  }
}
