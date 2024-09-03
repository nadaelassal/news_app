// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/category/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.onCategorySelected});

  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        id: 'Sports',
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        id: 'Sports',
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        id: 'Sports',
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        id: 'Sports',
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        id: 'Sports',
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        id: 'Sports',
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Pick your category of interest',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.navy),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, inex) {
                final category = categories[inex];
                return GestureDetector(
                  onTap: () => onCategorySelected(category),
                  child: CategoryItem(
                    category: category,
                    index: inex,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
