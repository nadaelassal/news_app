// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/category/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
      CategoryModel(
        name: 'Sports',
        imageName: 'ball',
        color: Color(0XFFC91C22),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
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
              itemBuilder: (_, inex) => CategoryItem(
                category: categories[inex],
                index: inex,
              ),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
