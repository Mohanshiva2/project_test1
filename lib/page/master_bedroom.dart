import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Master_bedRoom extends StatefulWidget {
  const Master_bedRoom({Key? key}) : super(key: key);

  @override
  _Master_bedRoomState createState() => _Master_bedRoomState();
}

class _Master_bedRoomState extends State<Master_bedRoom> {

  bool lightval = false;

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
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
              color: Colors.blue,
              height: 500,
            ),
            const Text(
              'Master BedRoom',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          lightval = !lightval;
                          http.put(
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
                        child: const Center(
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
                          lightval = !lightval;
                          http.put(
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
                        child: const Center(
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
            )
          ],
        ),
      ),
    );
  }
}
