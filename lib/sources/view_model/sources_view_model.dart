import 'package:flutter/material.dart';
import 'package:news_app/sources/data/data_source/sources_data_source.dart';
import 'package:news_app/sources/data/models/source.dart';

class SourcesViewModel with ChangeNotifier {
  final dataSource = SourcesDataSource();
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  Future getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await dataSource.getSources(categoryId);
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources!;
      } else {
        errorMessage = 'Failed to get sources';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
