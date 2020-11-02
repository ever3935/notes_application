import 'package:flutter/material.dart';
import 'package:notes_application/pallete.dart';

String title, text;
Color color;

class NotesSubScreen extends StatefulWidget {
  NotesSubScreen(String noteTitle, String noteText, Color notesColor) {
    title = noteTitle;
    text = noteText;
    color = notesColor;
  }

  @override
  _NotesSubScreenState createState() => _NotesSubScreenState();
}

class _NotesSubScreenState extends State<NotesSubScreen> {
  Future<void> _showMyDialog(double height, double width) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: blurBackgroundColor,
              border: Border.all(
                width: 2.0,
              )),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: backGroundColor,
            title: Text(
              'Edit Note',
              style: TextStyle(color: Colors.white),
            ),
            content: Container(
              height: height / 4,
              width: width * 0.75,
              child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Title', style: TextStyle(color: Colors.white)),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // hintText: 'Enter note title',
                        hintStyle: TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                      onChanged: (title) {
                        // msg = text;
                        title = title;
                      },
                    ),
                    Text('Text', style: TextStyle(color: Colors.white)),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // hintText: text,
                        prefixText: text,
                        hintStyle: TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                      onChanged: (text) {
                        // noteTemp = noteText;
                        text = text;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Back', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Edit', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  // notesHeading.add(msg);
                  // notes.add(noteTemp);
                  // noteTemp = ' ';
                  // setState(() {
                  //   listViewCount++;
                  //   toEnd();
                  // });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backGroundColor,
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _showMyDialog(_height, _width);
            });
          },
          child: Icon(Icons.edit),
          backgroundColor: color,
          elevation: 5.0,
          highlightElevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              SizedBox(
                height: _height * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 37, color: Colors.white),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              text,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
