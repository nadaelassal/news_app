// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/category/categories_grid.dart';
import 'package:news_app/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
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
        drawer: HomeDrawer(
          onItemSelected: (String) {},
        ),
        body: CategoriesGrid(),
      ),
    );
  }
}
