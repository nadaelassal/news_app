import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/shared/api_constants.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/models/sources_response.dart';

class SourcesAPIDataSource {
  Future<List<Source>> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiConstants.baseURL,
      ApiConstants.sourcesEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponse.fromJson(json);

    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Faile to ge sources');
    }
  }
}
