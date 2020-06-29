import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int img = 1;
  int counter = 3;
  Timer timer;
  void startTimer() {
    counter = 3;
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
//                Color(0xff27368f),
//                Color(0xff27468f),
//                Color(0xff27548f),
//
//                Color(0xff27468f),
//                Color(0xff27368f)

                Color(0xff5c1111),

                Color(0xff4a0e0e),
                Color(0xff360808),
                Color(0xff240303),
                Color(0xff000000)
              ]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (counter == 0)
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image(
                        image: AssetImage('images/$img.png'),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(''),
                    ),
              Text(
                '$counter',
                style: TextStyle(
                  color: Color(0xffffcc40),
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    img = Random().nextInt(3) + 1;
                    startTimer();
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.085,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xffd19900),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Text(
                      'Play Again',
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
