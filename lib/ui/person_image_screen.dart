import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:popular_people/models/person_details/person_images/person_profiles.dart';
import 'package:popular_people/utils/config.dart';
import 'package:popular_people/widgets/shared_widgets/circular_progress_indicator_widget.dart';
import 'package:popular_people/widgets/shared_widgets/image_builder.dart';
import 'package:popular_people/utils/style/colors.dart' as Style;

class PersonImageScreen extends StatefulWidget {
  static String routeName = "/person_image_screen";

  @override
  _PersonImageScreenState createState() => _PersonImageScreenState();
}

class _PersonImageScreenState extends State<PersonImageScreen> {
  int _progress = 0;

  @override
  void initState() {
    super.initState();

    ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
      setState(() {
        _progress = progress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    PersonProfiles personProfiles = ModalRoute.of(context).settings.arguments;

    return Stack(
      children: [
        Container(
          child: ImageBuilder(
            image: personProfiles.filePath,
            width: personProfiles.width.toDouble(),
            height: personProfiles.height.toDouble(),
            radius: 10,
          ),
        ),
        Positioned(
          right: 0.0,
          left: 0.0,
          bottom: 16.0,
          child: FloatingActionButton(
            onPressed: () async {
              try {
                // save image to mobile storage.
                await ImageDownloader.downloadImage(
                    "$imageURL${personProfiles.filePath}");
              } on PlatformException catch (error) {
                print('Saving Error: $error');
              }
            },
            child: _progress != 0 && _progress != 100
                ? CircularProgressIndicatorWidget()
                : Icon(
                    _progress == 0 ? Icons.save : Icons.done,
                    color: Style.Colors.secondaryColor,
                    size: 24.0,
                  ),
          ),
        ),
      ],
    );
  }
}
