import 'package:equatable/equatable.dart';

abstract class PopularPeopleEvent extends Equatable {
  const PopularPeopleEvent();

  @override
  List<Object> get props => [];
}

class FetchPopularPeople extends PopularPeopleEvent {
  FetchPopularPeople();

  @override
  List<Object> get props => [];
}
