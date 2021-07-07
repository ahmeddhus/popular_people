import 'dart:convert';
import 'dart:io';

import 'package:popular_people/models/person_details/person_details.dart';
import 'package:popular_people/models/person_details/person_images/person_images.dart';
import 'package:popular_people/utils/config.dart';
import 'package:popular_people/utils/constants.dart';
import 'package:http/http.dart' as http;

class PersonDetailsService {
  Future<PersonDetails> fetchPersonDetails(int id) async {
    var queryParameters = {
      'api_key': API_KEY,
      'language': 'en-US',
      'append_to_response': '1',
    };

    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    Uri uri = Uri.parse('$baseURL/person/$id');
    final finalUri = uri.replace(queryParameters: queryParameters);

    var response = await http.get(
      finalUri,
      headers: header,
    );

    return PersonDetails.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }


  static Future<PersonImages> fetchPersonImages(int id) async {
    var queryParameters = {
      'api_key': API_KEY,
      'language': 'en-US',
      'append_to_response': '1',
    };

    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    Uri uri = Uri.parse('$baseURL/person/$id/images');
    final finalUri = uri.replace(queryParameters: queryParameters);

    var response = await http.get(
      finalUri,
      headers: header,
    );

    return PersonImages.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
