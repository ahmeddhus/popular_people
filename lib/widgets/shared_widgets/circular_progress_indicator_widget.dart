import 'package:flutter/material.dart';
import 'package:popular_people/utils/style/colors.dart' as Style;

class CircularProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 5,
            valueColor:
                new AlwaysStoppedAnimation<Color>(Style.Colors.primaryColor),
          ),
        ),
      ),
    );
  }
}
