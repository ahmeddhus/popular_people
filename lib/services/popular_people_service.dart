import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:popular_people/models/person/person_response.dart';
import 'package:popular_people/utils/config.dart';
import 'package:popular_people/utils/constants.dart';

class PopularPeopleService {
  Future<PersonResponse> fetchPopularPeoples() async {
    var queryParameters = {
      'api_key': API_KEY,
      'language': 'en-US',
      'page': '1',
    };

    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    Uri uri = Uri.parse('$baseURL/person/popular');
    final finalUri = uri.replace(queryParameters: queryParameters);

    var response = await http.get(
      finalUri,
      headers: header,
    );

    return PersonResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
