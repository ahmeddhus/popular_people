import 'package:equatable/equatable.dart';

abstract class PersonDetailsEvent extends Equatable {
  const PersonDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchPersonDetails extends PersonDetailsEvent {
  final int id;

  FetchPersonDetails(this.id);

  @override
  List<Object> get props => [];
}
