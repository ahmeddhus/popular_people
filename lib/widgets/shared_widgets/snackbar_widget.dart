import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, int second) {
  Scaffold.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: second),
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
  ));
}
