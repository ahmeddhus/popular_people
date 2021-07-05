import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:popular_people/models/person/person_response.dart';
import 'package:popular_people/utils/config.dart';
import 'package:popular_people/utils/constants.dart';

class PopularPeopleService {
  Future<PersonResponse> fetchPopularPeoples() async {
    var params = {"api_key": API_KEY, "language": "en-US", "page": 1};

    Map<String, String> headers = {'Content-Type': 'application/json'};

    var response = await http.post('$baseURL/movie/popular',
        body: jsonEncode(params), headers: headers);
    print(utf8.decode(response.bodyBytes));
    return PersonResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
