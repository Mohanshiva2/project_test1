import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Hall extends StatefulWidget {
  const Hall({Key? key}) : super(key: key);

  @override
  _HallState createState() => _HallState();
}

class _HallState extends State<Hall> {
  bool lightval = false;
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SingleChildScrollView(
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
                'Hall',
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
                            lightval = !lightval;
                            final response = http.put(
                              Uri.parse('http://192.168.1.18/15/'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
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
                          child: const Center(
                            child: Text(
                              'Tube light',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            lightval = !lightval;
                            final response = http.put(
                              Uri.parse('http://192.168.1.18/16/'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
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
                          child: const Center(
                            child: Text(
                              'Spot Light',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Slider(
                        value: _currentSliderValue,
                        max: 100,
                        divisions: 5,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            lightval = !lightval;
                            final response = http.put(
                              Uri.parse('http://192.168.1.18/16/'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, bool>{
                                "Device_Status": lightval,
                              }),
                            );
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                          height: 200,
                          width: 300,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Spot Light',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
