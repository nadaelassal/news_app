// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/category/view/widgets/categories_grid.dart';
import 'package:news_app/category/view/widgets/category_datails.dart';
import 'package:news_app/category/data/models/category_model.dart';
import 'package:news_app/home/view/widgets/home_drawer.dart';
import 'package:news_app/home/view/widgets/news_search_delegate.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'News App',
          ),
          actions: [
            IconButton(onPressed: () =>
               showSearch(context: context, delegate: NewsSearchDelegate()),
             icon: Icon(Icons.search , size: 32,),),
          ],
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
