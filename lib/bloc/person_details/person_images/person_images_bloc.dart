import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/bloc/person_details/person_images/person_images_events.dart';
import 'package:popular_people/bloc/person_details/person_images/person_images_states.dart';
import 'package:popular_people/models/person_details/person_images/person_images.dart';
import 'package:popular_people/services/person_details_service.dart';

class PersonImagesBloc extends Bloc<PersonImagesEvent, PersonImagesState> {
  PersonImagesBloc() : super(PersonImagesUninitialized());

  @override
  Stream<PersonImagesState> mapEventToState(PersonImagesEvent event) async* {
    if (event is FetchPersonImages) {
      yield* getPersonImages(event);
    }
  }

  Stream<PersonImagesState> getPersonImages(FetchPersonImages event) async* {
    yield PersonImagesLoading();

    try {
       PersonImages personImages =
          await PersonDetailsService.fetchPersonImages(event.id);

      if (personImages != null) {
        yield PersonImagesSuccess(personImages: personImages);
      } else if (personImages.profiles.isEmpty) {
        yield NoPersonImages();
      } else {
        yield PersonImagesError();
      }
    } on Exception catch (e) {
      yield PersonImagesAPIFailed();
      print('PersonImagesAPIFailed ${e.toString()}');
    }
  }
}
