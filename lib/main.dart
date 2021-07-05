import 'package:flutter/material.dart';
import 'package:popular_people/ui/popular_people_screen.dart';
import 'package:popular_people/utils/navigation/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular People Demo',
      initialRoute: PopularPeopleScreen.routeName,
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PopularPeopleScreen(),
    );
  }
}
