import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/bloc/person_details/person_images/person_images_bloc.dart';
import 'package:popular_people/bloc/person_details/person_images/person_images_events.dart';
import 'package:popular_people/bloc/person_details/person_images/person_images_states.dart';
import 'package:popular_people/ui/person_image_screen.dart';
import 'package:popular_people/utils/navigation/navigators.dart';
import 'package:popular_people/widgets/shared_widgets/circular_progress_indicator_widget.dart';
import 'package:popular_people/widgets/shared_widgets/image_builder.dart';
import 'package:popular_people/widgets/shared_widgets/snackbar_widget.dart';

class PersonImagesWidget extends StatelessWidget {
  final int id;

  PersonImagesWidget(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: BlocProvider<PersonImagesBloc>(
        create: (context) => PersonImagesBloc()..add(FetchPersonImages(id)),
        child: BlocConsumer<PersonImagesBloc, PersonImagesState>(
          listener: (context, state) {
            if (state is NoPersonImages) showSnackBar(context, 'No Images', 1);
            if (state is PersonImagesError) showSnackBar(context, 'Error', 1);
            if (state is PersonImagesAPIFailed)
              showSnackBar(context, 'Error', 1);
          },
          builder: (context, state) {
            PersonImagesBloc personImagesBloc = BlocProvider.of(context);
            return _imageGridWidget(context, personImagesBloc, state);
          },
        ),
      ),
    );
  }

  Widget _imageGridWidget(
      BuildContext context, PersonImagesBloc bloc, PersonImagesState state) {
    return state is PersonImagesLoading
        ? CircularProgressIndicatorWidget()
        : state is PersonImagesSuccess
            ? GridView.count(
                crossAxisCount: 1,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: state.personImages.profiles
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            pushNameWithArguments(
                                context, PersonImageScreen.routeName, e);
                          },
                          child: ImageBuilder(
                            image: e.filePath,
                            width: 130.0,
                            height: 130.0,
                            radius: 10,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            : Text('NO Date');
  }
}
