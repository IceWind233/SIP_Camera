
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/handleDrag.dart';

class Camera extends StatefulWidget {

  @override
  _CameraState createState() => _CameraState();
} 

class _CameraState extends State<Camera> {

  Dragger dragger = Dragger();

  void navigateToMainPage() {
    Navigator.pop(context);
  }

  void handleVerticalDragEnd(){
    dragger.handleDragEnd(
      () {},
      () {
        navigateToMainPage();
      },
      100.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIP Camera'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: const Text('This is the Camera Page'), 
        ),

        onVerticalDragStart: (details) {
          dragger.handleDragStart(details.globalPosition.dy);
        },

        onVerticalDragUpdate: (details) {
          dragger.handleDragUpdate(details.globalPosition.dy);
        },

        onVerticalDragEnd: (details) {
          handleVerticalDragEnd();
        },

      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          navigateToMainPage();
        },
        child: const Icon(Icons.arrow_back),
      )
    );
  }
}