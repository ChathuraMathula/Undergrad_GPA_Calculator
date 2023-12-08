import 'package:flutter/material.dart';

Color getColorByCourseYear(int courseYear) {
  List<Color> colors = const [
    Color.fromARGB(255, 102, 204, 255),
    Color.fromARGB(255, 153, 102, 255),
    Color.fromARGB(255, 255, 102, 204),
    Color.fromARGB(255, 255, 153, 153),
    Color.fromARGB(255, 255, 204, 102),
    Color.fromARGB(255, 102, 255, 204),
  ];

  return colors[courseYear % colors.length];
}
