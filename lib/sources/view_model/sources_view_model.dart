import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/repository/sources_repository.dart';

/*class SourcesViewModel extends Cubit<SourcesStates> {
  final SourcesRepository repository;
  SourcesViewModel() : super(SourcesInitial());
}*/

class SourcesViewModel with ChangeNotifier {
  final dataSource = SourcesAPIDataSource();
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  Future getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();

    try {
      sources = await dataSource.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
