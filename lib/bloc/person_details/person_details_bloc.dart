import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/bloc/person_details/person_details_events.dart';
import 'package:popular_people/bloc/person_details/person_details_states.dart';
import 'package:popular_people/models/person_details/person_details.dart';
import 'package:popular_people/repositories/person_details_repository.dart';

class PersonDetailsBloc extends Bloc<PersonDetailsEvent, PersonDetailsState> {
  PersonDetailsBloc() : super(PersonDetailsUninitialized());

  @override
  Stream<PersonDetailsState> mapEventToState(PersonDetailsEvent event) async* {
    if (event is FetchPersonDetails) {
      yield* getPersonDetails(event);
    }
  }

  Stream<PersonDetailsState> getPersonDetails(FetchPersonDetails event) async* {
    yield PersonDetailsLoading();

    try {
      PersonDetails personDetails =
          await PersonDetailsRepository.fetchPersonDetails(event.id);

      if (personDetails != null) {
        yield PersonDetailsSuccess(personDetails: personDetails);
      } else {
        yield PersonDetailsError();
      }
    } on Exception catch (e) {
      yield PersonDetailsAPIFailed();
      print('PersonDetailsAPIFailed ${e.toString()}');
    }
  }
}
