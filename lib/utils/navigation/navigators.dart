import 'package:flutter/material.dart';

void pushNameWithArguments(BuildContext context, String route, argument) {
  Navigator.of(context).pushNamed(route, arguments: argument);
}
