import 'package:popular_people/models/person/person_response.dart';
import 'package:popular_people/services/popular_people_service.dart';

class PopularPeopleRepository {
  static Future<PersonResponse> fetchPopularPeoples() async {
    PopularPeopleService _peopleService = PopularPeopleService();

    PersonResponse popularPeople = await _peopleService.fetchPopularPeoples();

    return popularPeople;
  }
}
