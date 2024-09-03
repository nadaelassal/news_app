// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/tabs/tab_item.dart';

class CategoryDatails extends StatefulWidget {
  const CategoryDatails(this.categoryId);

  final String categoryId;

  @override
  State<CategoryDatails> createState() => _CategoryDatailsState();
}

class _CategoryDatailsState extends State<CategoryDatails> {
  int selectedTabIndex = 0;
  final sources = List.generate(10, (index) => 'Source $index');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: sources.length,
            child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                onTap: (index) => setState(() => selectedTabIndex = index),
                tabs: sources
                    .map(
                      (source) => TabItem(
                        source: source,
                        isSelected: sources.indexOf(source) == selectedTabIndex,
                      ),
                    )
                    .toList())),
        Expanded(
            child: ListView.builder(
          itemBuilder: (_, index) => NewsItem(),
          itemCount: 10,
        ))
      ],
    );
  }
}
