// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/tabs/sources_tabs.dart';
import 'package:news_app/widgets/error_indicator.dart';
import 'package:news_app/widgets/loading_indicator.dart';

class CategoryDatails extends StatelessWidget {
  const CategoryDatails(this.categoryId);

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourcesTabs(sources);
        }
      },
    );
  }
}
