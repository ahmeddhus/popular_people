import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/bloc/person_details/person_details_bloc.dart';
import 'package:popular_people/bloc/person_details/person_details_events.dart';
import 'package:popular_people/bloc/person_details/person_details_states.dart';
import 'package:popular_people/utils/style/colors.dart' as Style;
import 'package:popular_people/widgets/person_images_widget.dart';
import 'package:popular_people/widgets/shared_widgets/circular_progress_indicator_widget.dart';
import 'package:popular_people/widgets/shared_widgets/image_builder.dart';
import 'package:popular_people/widgets/shared_widgets/snackbar_widget.dart';

class PopularPersonScreen extends StatefulWidget {
  static String routeName = "/popular_person_screen";

  @override
  _PopularPersonScreenState createState() => _PopularPersonScreenState();
}

class _PopularPersonScreenState extends State<PopularPersonScreen> {
  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.primaryColor,
        centerTitle: true,
        title: Text(
          '',
          style: TextStyle(
            color: Style.Colors.secondaryColor,
          ),
        ),
      ),
      body: BlocProvider<PersonDetailsBloc>(
        create: (context) => PersonDetailsBloc()..add(FetchPersonDetails(id)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<PersonDetailsBloc, PersonDetailsState>(
              listener: (context, state) {
                if (state is PersonDetailsError)
                  showSnackBar(context, 'Error', 1);
                if (state is PersonDetailsAPIFailed)
                  showSnackBar(context, 'Error', 1);
              },
              builder: (context, state) {
                PersonDetailsBloc personDetailsBloc = BlocProvider.of(context);

                return _personDetails(context, personDetailsBloc, state);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _personDetails(
      BuildContext context, PersonDetailsBloc bloc, PersonDetailsState state) {
    return state is PersonDetailsLoading
        ? CircularProgressIndicatorWidget()
        : state is PersonDetailsSuccess
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageBuilder(
                    image: state.personDetails.profilePath,
                    width: 130.0,
                    height: 130.0,
                    radius: 10,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    state.personDetails.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.personDetails.knownForDepartment,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          '|',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Text(
                        state.personDetails.popularity.toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          '|',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Text(
                        state.personDetails.adult.toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    state.personDetails.birthday,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0),
                    child: SizedBox(
                      height: 200.0,
                      child: SingleChildScrollView(
                        child: Text(
                          state.personDetails.biography,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  PersonImagesWidget(state.personDetails.id),
                ],
              )
            : Center(
                child: Text(
                  'No Data',
                ),
              );
  }
}
