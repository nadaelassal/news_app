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
        id: 'sports',
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        id: 'business',
        name: 'Business',
        imageName: 'bussines',
        color: Color(0XFFCF7E48),
      ),
      CategoryModel(
        id: 'politics',
        name: 'Politics',
        imageName: 'Politics',
        color: Color(0XFF003E90),
      ),
      CategoryModel(
        id: 'health',
        name: 'Health',
        imageName: 'health',
        color: Color(0XFFED1E79),
      ),
      CategoryModel(
        id: 'environment',
        name: 'Environment',
        imageName: 'environment',
        color: Color(0XFF4882CF),
      ),
      CategoryModel(
        id: 'science',
        name: 'Science',
        imageName: 'science',
        color: Color(0XFFF2D352),
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
              itemBuilder: (_, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () => onCategorySelected(category),
                  child: CategoryItem(
                    category: category,
                    index: index,
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
