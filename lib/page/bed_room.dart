import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Bed_Room extends StatefulWidget {
  const Bed_Room({Key? key}) : super(key: key);

  @override
  _Bed_RoomState createState() => _Bed_RoomState();
}

class _Bed_RoomState extends State<Bed_Room> {
  bool lightval = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
       body:
       SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
              color: Colors.blue,
              height: 500,
            ),
            Container(
              child: Text(
                'Bed Room',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            print('i am pressed');
                            lightval = !lightval;
                            final response = http.put(
                              Uri.parse('http://192.168.1.18/'),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, bool>{
                                "Device_Status": lightval,
                              }),
                            );
                          });
                        },
                        child: Container(
                          height: 200,
                          width: 300,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Bulb',
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            print('i am pressed');
                            lightval = !lightval;
                            final response = http.put(
                              Uri.parse('http://192.168.1.18/'),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, bool>{
                                "Device_Status": lightval,
                              }),
                            );
                          });
                        },
                        child: Container(
                          height: 200,
                          width: 300,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Outside Bulb',
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),



                ],
              ),
            )
          ],
        ),
    ),
      );
  }
}
