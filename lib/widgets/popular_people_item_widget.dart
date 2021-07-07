import 'package:flutter/material.dart';
import 'package:popular_people/models/person/person.dart';
import 'package:popular_people/ui/popular_person_screen.dart';
import 'package:popular_people/utils/navigation/navigators.dart';
import 'package:popular_people/widgets/shared_widgets/image_builder.dart';

class PopularPeopleItemWidget extends StatefulWidget {
  final Person person;

  PopularPeopleItemWidget(this.person);

  @override
  _PopularPeopleItemWidgetState createState() =>
      _PopularPeopleItemWidgetState(person);
}

class _PopularPeopleItemWidgetState extends State<PopularPeopleItemWidget> {
  final Person person;

  _PopularPeopleItemWidgetState(this.person);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        pushNameWithArguments(
            context,
            PopularPersonScreen.routeName,
            person.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ImageBuilder(
              image: person.profilePath,
              width: 130.0,
              height: 130.0,
              radius: 10,
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                person.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                person.knownForDepartment,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
