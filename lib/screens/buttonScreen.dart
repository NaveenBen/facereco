import 'package:flutter/material.dart';
import 'package:facialreco/screens/FaceReco.dart';

class buttonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 23,
        child: Container(
          padding: EdgeInsets.only(top: 200),
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FaceReco()));
                },
                child: Text("Recognise"),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text("Authenciate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}