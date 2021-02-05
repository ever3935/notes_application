import 'libraries.dart';

class NotesMainScreen extends StatefulWidget {
  @override
  _NotesMainScreenState createState() => _NotesMainScreenState();
}

int listViewCount = 0;
int temp = 0;
int tempIndex;
List<String> notesHeading = [];
List<String> notes = [];
String noteTemp = ' ';

ScrollController _scrollController;
_scrollListener() {
  if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
      !_scrollController.position.outOfRange) {}
  if (_scrollController.offset <= _scrollController.position.minScrollExtent &&
      !_scrollController.position.outOfRange) {}
}

class _NotesMainScreenState extends State<NotesMainScreen> {
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void toEnd() {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }

    Future<void> _showColorPickerDialog() async {
      void changeColor(Color color) {
        setState(() => pickerColor = color);
      }

      return showDialog(
        context: context,
        child: Container(
          decoration: BoxDecoration(
              color: blurBackgroundColor,
              border: Border.all(
                width: 2.0,
              )),
          child: AlertDialog(
            contentTextStyle: TextStyle(
              color: Colors.white,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: backGroundColor,
            title: Text(
              'Pick note color',
              style: TextStyle(color: Colors.white),
            ),
            content: SingleChildScrollView(
              child: ColorPicker(
                labelTextStyle: TextStyle(color: Colors.white),
                pickerColor: pickerColor,
                onColorChanged: changeColor,
                showLabel: false,
                pickerAreaHeightPercent: 0.8,
              ),
              // Use Material color picker:
              //
              // child: MaterialPicker(
              //   pickerColor: pickerColor,
              //   onColorChanged: changeColor,
              // ),
              //
              // Use Block color picker:
              //
              // child: BlockPicker(
              //   pickerColor: currentColor,
              //   onColorChanged: changeColor,
              // ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Back', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    }

    Future<void> _notesAddError(double height, double width) async {
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: backGroundColor,
              title: Text(
                'Error',
                style: TextStyle(color: Colors.white),
              ),
              content: Container(
                height: height / 7,
                width: width * 0.75,
                child: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Enter atleast a title to add a note.',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    String msg;
    Future<void> _showAddNoteDialog(double height, double width) async {
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: backGroundColor,
              title: Text(
                'Add Note',
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
                          hintText: 'Enter note title',
                          hintStyle: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        onChanged: (text) {
                          msg = text;
                        },
                      ),
                      Text('Text', style: TextStyle(color: Colors.white)),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter note here...',
                          hintStyle: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        onChanged: (noteText) {
                          noteTemp = noteText;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Reject', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Add', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (msg == null || noteTemp == null) {
                      Navigator.pop(context);
                      _notesAddError(height, width);
                    } else {
                      if (currentColor != null) {
                        colorList.add(currentColor);
                      } else {
                        colorList.add(pickerColor);
                      }
                      notesHeading.add(msg);
                      notes.add(noteTemp);
                      noteTemp = ' ';
                      setState(() {
                        listViewCount++;
                        toEnd();
                      });
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backGroundColor,
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _showAddNoteDialog(_height, _width);
            });
          },
          child: Icon(Icons.add),
          backgroundColor: backGroundColor,
          elevation: 5.0,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            SizedBox(
              height: _height * 0.05,
            ),
            buildHeadingRow(
              pickerColor,
              _width,
              _showColorPickerDialog,
              currentColor,
            ),
            buildGridView(
              context,
              _scrollController,
              listViewCount,
              tempIndex,
              notesHeading,
              notes,
              _height,
            ),
          ],
        ),
      ),
    );
  }
}
