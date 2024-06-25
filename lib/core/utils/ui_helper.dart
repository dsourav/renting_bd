import 'package:flutter/material.dart';

abstract class UiHelper {
  static double horizontalMargin = 20.0;
  static double defaultMargin = 20.0;

  static double defaultBorderRadius = 8.0;

  static height(context) => MediaQuery.of(context).size.height;
  static width(context) => MediaQuery.of(context).size.width;
}
