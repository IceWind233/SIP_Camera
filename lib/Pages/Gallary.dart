import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../Utils/handleDrag.dart';

class Gallary extends StatefulWidget {

  @override
  _GallaryState createState() => _GallaryState();
}

class _GallaryState extends State<Gallary> {

  void navigateToMainPage() {
    Navigator.pop(context);
  }

  void handleVerticalDragEnd(){
    dragger.handleDragEnd(
      () {
        navigateToMainPage();
      },
      () {},
      100.0
    );
  }

  Dragger dragger = Dragger();

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
          child: const Text('This is the Gallary Page'), 
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

