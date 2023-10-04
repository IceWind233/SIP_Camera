import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/Pages/ImgProc.dart';
import 'package:flutter_app/Components/Media.dart';
import 'package:flutter_app/Components/CamToolBar.dart';
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

  void navigateToImgProcPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImgProc())
    );
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
        child: Stack(
          children: [
              Media(),
              Consumer<CamProfile>(builder: (context, camProfile, child) => Text('${camProfile.zoomValue}'),),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CamToolBar()
              ),
          ],
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

          navigateToImgProcPage();
        },
        child: const Icon(Icons.image),
      )
    );
  }
}