import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

class FaceReco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FaceFinder();
  }
}

class FaceFinder extends StatefulWidget {
  @override
  _FaceFinderState createState() => _FaceFinderState();
}

class _FaceFinderState extends State<FaceFinder> {
  File _imageFile;
  List<Face> _faces;
  bool isLoading = false;
  final picker = ImagePicker();
  int fl = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            OutlinedButton(
              child: Text("choose image"),
              onPressed: () {
                SearchFace();
              },
            ),
            Text("Total no of faces recognised from image $fl")
          ],
        ),
      ),
    );
  }

  void SearchFace() async {
    await Firebase.initializeApp();
    final DatabaseReference dr =
        FirebaseDatabase.instance.reference().child("users");
    final imageFile = await picker.getImage(source: ImageSource.gallery);
    final image = FirebaseVisionImage.fromFile(File(imageFile.path));
    FaceDetectorOptions options =
        new FaceDetectorOptions(enableLandmarks: true, enableContours: true);
    final faceDetector = FirebaseVision.instance.faceDetector(options);
    List<Face> faces = await faceDetector.processImage(image);
    Face face = faces[0];
    face.getLandmark(FaceLandmarkType.leftCheek);
    face.getContour(FaceContourType.allPoints);
    // var xm = Map();
    // var fm = Map();
    // var x = face.getContour(FaceContourType.allPoints);
    // var fpl = 1;
    // for (var pos in x.positionsList) {
    //   fm.addAll({
    //     fpl.toString(): {pos.dx.toString(): pos.dy.toString()}
    //   });
    //   fpl += 1;
    //   xm.addAll(fm);
    // }
    // dr.push().set({"face": xm});
    // // users.add({"face":xm});
    // print(xm);
    setState(() {
      fl = faces.length;
    });
  }
}
