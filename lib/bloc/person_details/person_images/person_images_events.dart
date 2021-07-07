import 'package:equatable/equatable.dart';

abstract class PersonImagesEvent extends Equatable {
  const PersonImagesEvent();

  @override
  List<Object> get props => [];
}

class FetchPersonImages extends PersonImagesEvent {
  final int id;

  FetchPersonImages(this.id);

  @override
  List<Object> get props => [];
}
