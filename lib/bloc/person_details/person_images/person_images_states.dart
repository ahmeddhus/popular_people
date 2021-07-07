import 'package:equatable/equatable.dart';
import 'package:popular_people/models/error_response.dart';
import 'package:popular_people/models/person_details/person_images/person_images.dart';

class PersonImagesState extends Equatable {
  const PersonImagesState();

  @override
  List<Object> get props => [];
}

class PersonImagesUninitialized extends PersonImagesState {}

class PersonImagesLoading extends PersonImagesState {}

class PersonImagesSuccess extends PersonImagesState {
  final PersonImages personImages;

  PersonImagesSuccess({this.personImages});

  @override
  List<Object> get props => [personImages];
}

class NoPersonImages extends PersonImagesState {}

class PersonImagesError extends PersonImagesState {
  final ErrorResponse errorResponse;

  PersonImagesError({this.errorResponse});

  @override
  List<Object> get props => [errorResponse];
}

//Something in the API (maybe)
class PersonImagesAPIFailed extends PersonImagesState {}
