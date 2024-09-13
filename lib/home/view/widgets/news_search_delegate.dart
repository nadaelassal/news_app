// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/home/view/widgets/api_manager.dart';

import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/news/view/widgets/news_item.dart';

import 'package:news_app/shared/app_theme.dart';

import 'package:news_app/shared/widgets/error_indicator.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => showResults(context),
        icon: Icon(Icons.search),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(Icons.close)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text('Suggestions'),
      );
    }
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.searchNews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          } else if (snapshot.hasError || snapshot.data!.status != 'ok') {
            return ErrorIndicator('Error');
          } else {
            final newsList = snapshot.data?.news ?? [];
            return ListView.builder(
              itemBuilder: (_, index) => NewsItem(newsList[index]),
              itemCount: newsList.length,
            );
          }
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: AppTheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(32),
            right: Radius.circular(32),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        activeIndicatorBorder: BorderSide.none,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
