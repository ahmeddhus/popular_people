import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/bloc/popular_people/popular_people_events.dart';
import 'package:popular_people/bloc/popular_people/popular_people_states.dart';
import 'package:popular_people/models/person/person_response.dart';
import 'package:popular_people/repositories/popular_people_repository.dart';

class PopularPeopleBloc extends Bloc<PopularPeopleEvent, PopularPeopleState> {
  PopularPeopleBloc() : super(PopularPeopleUninitialized());

  @override
  Stream<PopularPeopleState> mapEventToState(PopularPeopleEvent event) async* {
    if (event is FetchCurrentPopularPeople) {
      yield* getPopularPeople(event);
    }
  }

  Stream<PopularPeopleState> getPopularPeople(
      FetchCurrentPopularPeople event) async* {
    yield PopularPeopleLoading();

    try {
      PersonResponse personResponse =
          await PopularPeopleRepository.fetchPopularPeoples();

      if (personResponse.results != null) {
        if (personResponse.totalResults > 0) {
          yield PopularPeopleSuccess(personResponse: personResponse);
        } else {
          yield NoPopularPeople(personResponse: personResponse);
        }
      } else {
        yield PopularPeopleError();
      }
    } on Exception catch (e) {
      yield PopularPeopleError();
      print('getCurrentOrders ${e.toString()}');
    }
  }
}
