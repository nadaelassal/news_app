import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.source, required this.isSelected});

  final String source;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : AppTheme.white,
          border: Border.all(
            width: 2,
            color: AppTheme.primary,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          source,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: isSelected ? AppTheme.white : AppTheme.primary,
              ),
        ));
  }
}
