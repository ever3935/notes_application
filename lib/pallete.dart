import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:notes_application/random_color.dart';

Color backGroundColor = Color.fromARGB(255, 37, 37, 37);
Color blurBackgroundColor = Color.fromARGB(150, 37, 37, 37);
Color headingColor = Color.fromARGB(255, 208, 208, 208);
Color addIconColor = Color.fromARGB(255, 252, 252, 252);
Color searchIconBackgroundColor = Color.fromARGB(255, 60, 60, 60);
Color defaultGridColor = Colors.pink;
// Color headingColor = Color.fromARGB(255, 208, 208, 208);
// Color headingColor = Color.fromARGB(255, 208, 208, 208);
// Color headingColor = Color.fromARGB(255, 208, 208, 208);
//double randomNumbr = math.Random().nextDouble();
Color pickerColor = Color(0xff443a49);
Color currentColor = Color(0xff443a49);
final List<Color> colorList = [
  Colors.red,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.purple,
  Colors.yellow,
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.blueGrey,
];

Color generateRandomColorFromFixedList() {
  return colorList[new Random().nextInt(3)];
}

Color generateRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}
