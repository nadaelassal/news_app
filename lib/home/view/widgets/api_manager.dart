import 'dart:convert';

import 'package:news_app/shared/api_constants.dart';
import 'package:news_app/news/data/models/news_response.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<NewsResponse> searchNews([String? query , String? sourceId]) async {
    final uri = Uri.https(
      ApiConstants.baseURL,
      ApiConstants.newsEndpoint,
      {'apiKey': ApiConstants.apiKey, 'sources': sourceId, 'q': query},
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
