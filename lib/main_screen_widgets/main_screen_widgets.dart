import 'package:notes_application/libraries.dart';

Container buildHeadingRow(Color _pickerColor, double _width,
    _showColorPickerDialog, Color _currentColor) {
  return Container(
    margin: EdgeInsets.only(left: 5, right: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notes',
          style: TextStyle(fontSize: 37, color: Colors.white),
        ),
        Container(
          child: _buildHeadingRowIcons(
              _pickerColor, _width, _showColorPickerDialog, _currentColor),
        ),
      ],
    ),
  );
}

Row _buildHeadingRowIcons(Color _pickerColor, double _width,
    _showColorPickerDialog, Color _currentColor) {
  Color _colorSetter() {
    if (_currentColor == null) {
      return _pickerColor;
    } else {
      return _currentColor;
    }
  }

  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: _colorSetter()),
        child: GestureDetector(
          child: Icon(
            Icons.color_lens_outlined,
            color: Colors.white,
            size: _width * 0.08,
          ),
          onTap: () {
            _showColorPickerDialog();
          },
        ),
      ),
      SizedBox(
        width: _width * 0.02,
      ),
      Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: searchIconBackgroundColor),
        child: GestureDetector(
          child: Icon(
            Icons.search_rounded,
            color: Colors.white,
            size: _width * 0.08,
          ),
        ),
      ),
    ],
  );
}

Expanded buildGridView(
    BuildContext context,
    ScrollController _scrollController,
    int listViewCount,
    int tempIndex,
    List<String> notesHeading,
    List<String> notes,
    double _height) {
  return Expanded(
    child: GridView.count(
      controller: _scrollController,
      crossAxisCount: 2,
      mainAxisSpacing: 5.0,
      children: List.generate(listViewCount, (index) {
        return Container(
          child: Center(
              child: GestureDetector(
            onTap: () {
              tempIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesSubScreen(
                      notesHeading[index], notes[index], colorList[index]),
                ),
              );
            },
            child: Container(
              height: _height / 4,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorList[index],
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        notesHeading[index],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            decorationColor: Colors.black),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          notes[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
        );
      }),
    ),
  );
}
