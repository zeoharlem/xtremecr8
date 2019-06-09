import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class BackgroundsPage extends StatefulWidget {
  @override
  _BackgroundsPageState createState() => _BackgroundsPageState();
}

class _BackgroundsPageState extends State<BackgroundsPage> {
  // create some values
  Color _pickerColor   = Color(0xff443a49);
  Color _currentColor  = Color(0xff443a49);

  void _changeColorSetPick(Color color){
    setState(() {
      _pickerColor  = color;
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    var _styleBtnRow  = TextStyle(
        fontFamily: "SourceSansPro",
        fontWeight: FontWeight.bold,
        fontSize: 13.0, color: Colors.grey
    );

    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            "Card Background",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Ubuntu",
            ),
          ),
          Row(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: _pickerColor,
                                onColorChanged: _changeColorSetPick,
                              ),
                            ),
                            actions: <Widget>[

                            ],
                          );
                        }
                    );
                  },
                  icon: Icon(Icons.format_color_fill),
                  label: Text(
                    "Color",
                    style: _styleBtnRow
                  )
              ),
              VerticalDivider(width: 1.0),
              FlatButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.camera),
                  label: Text("Camera", style: _styleBtnRow,)
              ),
              VerticalDivider(width: 1.0),
              FlatButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.add_photo_alternate),
                  label: Text("Gallery", style: _styleBtnRow,)
              ),

            ],
          )
        ],
      )
    );
  }
}

class WidgetTargetRow{
  static Color _targetWidget;

  WidgetTargetRow(_targetWidget);

  Color get getTargetWidget => _targetWidget;

  set setTargetWidget(Color targetWidget) => _targetWidget  = targetWidget;
}
