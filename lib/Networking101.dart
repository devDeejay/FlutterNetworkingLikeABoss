import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_like_a_boss/main.dart';

class TestHomeScreen extends StatefulWidget {
  @override
  TestHomeScreenState createState() => TestHomeScreenState();
}

class TestHomeScreenState extends State<TestHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 56,
                      ),
                      Text(
                        "Latest Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text("Total number of cases : 23"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Color(0xFFFD3951),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Get Latest Data",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
