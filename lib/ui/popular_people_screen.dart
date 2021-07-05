import 'package:flutter/material.dart';
import 'package:popular_people/utils/style/colors.dart' as Style;

class PopularPeopleScreen extends StatefulWidget {
  static String routeName = "/popular_people_screen";

  @override
  _PopularPeopleScreenState createState() => _PopularPeopleScreenState();
}

class _PopularPeopleScreenState extends State<PopularPeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Popular People Demo',
          style: TextStyle(
            color: Style.Colors.secondaryColor,
          ),
        ),
      ),
      body: Container(),
    );
  }
}