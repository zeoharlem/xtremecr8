import 'package:flutter/material.dart';

class DashboardFabBottomAppBarItem extends StatefulWidget {

  @override
  _DashboardFabBottomAppBarItemState createState() => _DashboardFabBottomAppBarItemState();
}

class _DashboardFabBottomAppBarItemState extends State<DashboardFabBottomAppBarItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.camera_alt),
        elevation: 2,
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      body: Scaffold(),
    );
  }
}

