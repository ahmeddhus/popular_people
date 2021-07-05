import 'package:equatable/equatable.dart';

abstract class PopularPeopleEvent extends Equatable {
  const PopularPeopleEvent();

  @override
  List<Object> get props => [];
}

class FetchCurrentPopularPeople extends PopularPeopleEvent {
  FetchCurrentPopularPeople();

  @override
  List<Object> get props => [];
}
