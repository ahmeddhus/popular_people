import 'package:equatable/equatable.dart';
import 'package:popular_people/models/error_response.dart';
import 'package:popular_people/models/person/person_response.dart';

class PopularPeopleState extends Equatable {
  const PopularPeopleState();

  @override
  List<Object> get props => [];
}

class PopularPeopleUninitialized extends PopularPeopleState {}

class PopularPeopleLoading extends PopularPeopleState {}

class PopularPeopleSuccess extends PopularPeopleState {
  final PersonResponse personResponse;

  PopularPeopleSuccess({this.personResponse});

  @override
  List<Object> get props => [personResponse];
}

class NoPopularPeople extends PopularPeopleState {
  final PersonResponse personResponse;

  NoPopularPeople({this.personResponse});

  @override
  List<Object> get props => [personResponse];
}

class PopularPeopleError extends PopularPeopleState {
  final ErrorResponse errorResponse;

  PopularPeopleError({this.errorResponse});

  @override
  List<Object> get props => [errorResponse];
}

//Something in the API (maybe)
class PopularPeopleAPIFailed extends PopularPeopleState {}
