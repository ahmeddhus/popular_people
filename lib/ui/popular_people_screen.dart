import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/bloc/popular_people/popular_people_bloc.dart';
import 'package:popular_people/bloc/popular_people/popular_people_events.dart';
import 'package:popular_people/bloc/popular_people/popular_people_states.dart';
import 'package:popular_people/utils/style/colors.dart' as Style;
import 'package:popular_people/widgets/popular_people_item_widget.dart';
import 'package:popular_people/widgets/shared_widgets/circular_progress_indicator_widget.dart';

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
      body: BlocProvider<PopularPeopleBloc>(
        create: (context) =>
            PopularPeopleBloc()..add(FetchCurrentPopularPeople()),
        child: Container(
          child: BlocConsumer<PopularPeopleBloc, PopularPeopleState>(
            listener: (context, state) {
              if (state is PopularPeopleLoading)
                print('state is PopularPeopleLoading');
              if (state is PopularPeopleSuccess)
                print('state is PopularPeopleSuccess');
              if (state is NoPopularPeople) print('state is NoPopularPeople');
              if (state is PopularPeopleError)
                print('state is PopularPeopleError');
            },
            builder: (context, state) {
              PopularPeopleBloc popularPeopleBloc = BlocProvider.of(context);
              return _popularPeopleList(context, popularPeopleBloc, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _popularPeopleList(
      BuildContext context, PopularPeopleBloc bloc, PopularPeopleState state) {
    return state is PopularPeopleLoading
        ? CircularProgressIndicatorWidget()
        : state is PopularPeopleSuccess
            ? GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: state.personResponse.results
                    .map(
                      (e) => PopularPeopleItemWidget(e),
                    )
                    .toList(),
              )
            : Center(
                child: Text(
                  'No Data',
                ),
              );
  }
}
