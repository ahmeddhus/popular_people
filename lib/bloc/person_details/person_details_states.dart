import 'package:equatable/equatable.dart';
import 'package:popular_people/models/error_response.dart';
import 'package:popular_people/models/person_details/person_details.dart';

class PersonDetailsState extends Equatable {
  const PersonDetailsState();

  @override
  List<Object> get props => [];
}

class PersonDetailsUninitialized extends PersonDetailsState {}

class PersonDetailsLoading extends PersonDetailsState {}

class PersonDetailsSuccess extends PersonDetailsState {
  final PersonDetails personDetails;

  PersonDetailsSuccess({this.personDetails});

  @override
  List<Object> get props => [personDetails];
}

class PersonDetailsError extends PersonDetailsState {
  final ErrorResponse errorResponse;

  PersonDetailsError({this.errorResponse});

  @override
  List<Object> get props => [errorResponse];
}

//Something in the API (maybe)
class PersonDetailsAPIFailed extends PersonDetailsState {}
