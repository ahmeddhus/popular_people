import 'package:flutter/material.dart';
import 'package:popular_people/ui/person_image_screen.dart';
import 'package:popular_people/ui/popular_people_screen.dart';
import 'package:popular_people/ui/popular_person_screen.dart';

final Map<String, WidgetBuilder> routes = {
  PopularPeopleScreen.routeName: (context) => PopularPeopleScreen(),
  PopularPersonScreen.routeName: (context) => PopularPersonScreen(),
  PersonImageScreen.routeName: (context) => PersonImageScreen(),
};