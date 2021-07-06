import 'package:flutter/material.dart';
import 'package:popular_people/utils/config.dart';

class ImageBuilder extends StatelessWidget {
  final String image;
  final double height, width, radius;

  ImageBuilder({this.image, this.width, this.height, this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: image != null
          ? Image.network(
              '$imageURL$image',
              height: height,
              width: width,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace stackTrace) {
                return Image.asset(
                  'assets/images/no_person_img.png',
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                );
              },
            )
          : Image.asset(
              'assets/images/no_person_img.png',
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
    );
  }
}
