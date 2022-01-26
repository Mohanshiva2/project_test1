import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_test1/nav_page/setting.dart';

import '../home_page.dart';
import 'dashboard.dart';

class Routine extends StatefulWidget {
  const Routine({Key? key}) : super(key: key);

  @override
  _RoutineState createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black38,
        shape: CircularNotchedRectangle(),
        child: Container(
          color: Colors.black38,
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.dashboard),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DashBoard()));
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.light),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Routine()));
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.settings),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Setting()));
                  });
                },
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
