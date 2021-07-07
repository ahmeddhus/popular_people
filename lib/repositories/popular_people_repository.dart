import 'package:connectivity/connectivity.dart';
import 'package:popular_people/local_storage/db_helper.dart';
import 'package:popular_people/models/person/person.dart';
import 'package:popular_people/models/person/person_response.dart';
import 'package:popular_people/services/popular_people_service.dart';

class PopularPeopleRepository {
  static Future<PersonResponse> fetchPopularPeoples() async {
    PopularPeopleService _peopleService = PopularPeopleService();

    var connectivityResult = await (Connectivity().checkConnectivity());
    final dbHelper = DbHelper.instance;

    if (connectivityResult == ConnectivityResult.none) {
      final savedPopularPeople = await dbHelper.queryAllRows();
      PersonResponse personResponse;

      List<Person> person = List<Person>.from(savedPopularPeople
          .map((savedPopularPeople) => Person.fromJson(savedPopularPeople)));

      personResponse = PersonResponse(
          page: 1, results: person, totalPages: person.length, totalResults: person.length);

      return personResponse;
    } else {
      PersonResponse popularPeople = await _peopleService.fetchPopularPeoples();
      for (final popularPerson in popularPeople.results) {
        dbHelper.insert(popularPerson.toMap());
      }

      return popularPeople;
    }
  }
}
