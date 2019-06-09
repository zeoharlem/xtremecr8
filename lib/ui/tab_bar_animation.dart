import 'dart:math';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:xtremecr8/pages/add_user.dart';
import 'package:xtremecr8/pages/camera_page.dart';
import 'package:xtremecr8/pages/design_page.dart';
import 'package:xtremecr8/pages/settings_page.dart';
import 'package:xtremecr8/pages/templates_page.dart';

class TabBarAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BubblesState();
  }
}

class _BubblesState extends State<TabBarAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Bubble> bubbles;
  final int numberOfBubbles = 400;
  final Color color         = Colors.pink;
  String tabNo              = 'Add Tab';
  final double maxBubbleSize = 12.0;
  int _page                 = 0;
  TextStyle _fontStyleRow   = TextStyle(
      fontFamily: "Ubuntu", fontWeight: FontWeight.bold, fontSize: 15.0
  );
  TextStyle _descStyleRow   = TextStyle(
      fontFamily: "SourceSansPro", fontSize: 12.0
  );

  //create all the pages
  final TemplatePage _templatePage  = TemplatePage();
  final AddUserPage _addUserPage    = AddUserPage();
  final DesignPage _designPage      = DesignPage();
  final SettingsPage _settingsPage  = SettingsPage();
  final CameraPage _cameraPage      = CameraPage();

  Widget _showPage  = new CameraPage();

  Widget _pageChooser(int pageTracker){
    switch(pageTracker){
      case 0:
        return _addUserPage;
        break;
      case 1:
        return _designPage;
        break;
      case 2:
        return _cameraPage;
        break;
      case 3:
        return _templatePage;
        break;
      case 4:
        return _settingsPage;
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    // Initialize bubbles

    // animation controller
    _controller = new AnimationController(
        duration: const Duration(seconds: 1500), vsync: this);
    _controller.addListener(() {
      updateBubblePosition();
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("xcr8"),
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  child: Text(
                    "Menu",
                    style: TextStyle(fontFamily: "Ubuntu", fontWeight: FontWeight.bold, fontSize: 18.0),
                  )
              ),
              ListTile(
                title: Text("Created Account", style: _fontStyleRow),
                subtitle: Text("Manage Accounts Created", style: _descStyleRow),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Settings", style: _fontStyleRow,),
                subtitle: Text("Update Account Status", style: _descStyleRow),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("History", style: _fontStyleRow,),
                subtitle: Text("Check Account Created", style: _descStyleRow),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Design App", style: _fontStyleRow),
                subtitle: Text("Fix/Design The Card", style: _descStyleRow),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Log Out", style: _fontStyleRow),
              )
            ],
          )
      ),
      bottomNavigationBar: CurvedNavigationBar(
        initialIndex: _page,
        items: <Widget>[
          Icon(Icons.add, size: 25),
          Icon(Icons.add_photo_alternate, size: 25),
          Icon(Icons.camera_alt, size: 30),
          Icon(Icons.style, size: 25),
          Icon(Icons.settings, size: 25),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.teal,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            _page     = index;
            _showPage = _pageChooser(index);
          });
        },
      ),

      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Colors.teal,
          child: Center(
            child: _showPage,
          )
        ),
      ),

    );
  }

  void updateBubblePosition() {
    bubbles.forEach((it) => it.updatePosition());
    setState(() {});
  }
}

class BubblePainter extends CustomPainter {
  List<Bubble> bubbles;
  AnimationController controller;

  BubblePainter({this.bubbles, this.controller});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    bubbles.forEach((it) => it.draw(canvas, canvasSize));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Bubble {
  Color colour;
  double direction;
  double speed;
  double radius;
  double x;
  double y;

  Bubble(Color colour, double maxBubbleSize) {
    this.colour = colour.withOpacity(Random().nextDouble());
    this.direction = Random().nextDouble() * 360;
    this.speed = 1;
    this.radius = Random().nextDouble() * maxBubbleSize;
  }

  draw(Canvas canvas, Size canvasSize) {
    Paint paint = new Paint()
      ..color = colour
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    assignRandomPositionIfUninitialized(canvasSize);

    randomlyChangeDirectionIfEdgeReached(canvasSize);

    canvas.drawCircle(Offset(x, y), radius, paint);
  }

  void assignRandomPositionIfUninitialized(Size canvasSize) {
    if (x == null) {
      this.x = Random().nextDouble() * canvasSize.width;
    }

    if (y == null) {
      this.y = Random().nextDouble() * canvasSize.height;
    }
  }

  updatePosition() {
    var a = 180 - (direction + 90);
    direction > 0 && direction < 180
        ? x += speed * sin(direction) / sin(speed)
        : x -= speed * sin(direction) / sin(speed);
    direction > 90 && direction < 270
        ? y += speed * sin(a) / sin(speed)
        : y -= speed * sin(a) / sin(speed);
  }

  randomlyChangeDirectionIfEdgeReached(Size canvasSize) {
    if (x > canvasSize.width || x < 0 || y > canvasSize.height || y < 0) {
      direction = Random().nextDouble() * 360;
    }
  }
}