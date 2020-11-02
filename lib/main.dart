import 'package:flutter/material.dart';
import 'package:notes_application/notes_main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesMainScreen(),
    );
  }
}
