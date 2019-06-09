import 'package:flutter/material.dart';
import 'custom_shape_clipper.dart';

Color firstColorGradient  = Color(0xFFF47D15);
Color secondColorGradient = Color(0xFFEF772C);

List<String> locations  = ["Xtremecr8", "cr8", "Xtremecardz"];
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 13.0);
const TextStyle dropDownLabelStyle    = TextStyle(color: Colors.white, fontSize: 16.0);

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart()
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [
              firstColorGradient, secondColorGradient
            ])),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white,),
                      SizedBox(width: 16.0,),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text(locations[0],style: TextStyle(color: Colors.white, fontSize: 16.0)),
                            Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                          ],
                        ),
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(locations[0], style: dropDownMenuItemStyle,),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(locations[1], style: dropDownMenuItemStyle,),
                            value: 1,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
