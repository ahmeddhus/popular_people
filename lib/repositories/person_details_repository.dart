import 'package:popular_people/models/person_details/person_details.dart';
import 'package:popular_people/models/person_details/person_images/person_images.dart';
import 'package:popular_people/services/person_details_service.dart';

class PersonDetailsRepository {
  static Future<PersonDetails> fetchPersonDetails(int id) async {
    PersonDetailsService _personDetailsService = PersonDetailsService();

    PersonDetails personDetails =
        await _personDetailsService.fetchPersonDetails(id);

    return personDetails;
  }

  static Future<PersonImages> fetchPersonImages(int id) async {

    PersonImages personImages =
        await PersonDetailsService.fetchPersonImages(id);

    return personImages;
  }
}
