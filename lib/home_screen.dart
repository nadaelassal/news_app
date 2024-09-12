// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category/categories_grid.dart';
import 'package:news_app/category/category_datails.dart';
import 'package:news_app/category/category_model.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(
              'assets/images/pattern.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News App',
          ),
        ),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
        body: selectedCategory != null
            ? CategoryDatails(
                selectedCategory!.id,
              )
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : SettingsTab(),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem drawerItem) {
    selectedDrawerItem = drawerItem;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
