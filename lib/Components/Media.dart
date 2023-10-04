import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:camera/camera.dart';

import 'package:flutter_app/Components/CamToolBar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

// TODO : Recive camera quality from setting page and set it to camera controller
// TODO : Recive message from tool bar and set it to camera controller

class _MediaState extends State<Media> {
  final ResolutionPreset _resolutionPreset = ResolutionPreset.medium;

  bool _isCameraReady = false;

  late CameraController _camController;
  late Future<void> _initializeControllerFuture;

  Future<void> _initCamController() async {
    final cameras = await availableCameras();
    // 1st cam is back cam, 2nd cam is front cam
    var activatedCam = cameras[0];
    var resolution = ResolutionPreset.low;

    _camController = CameraController(
      activatedCam,
      resolution,
    );
    _initializeControllerFuture = _camController.initialize();
    setState(() {
      _isCameraReady = true;
    });
  }

  // get available cameras at initialization
  @override
  void initState() {
    super.initState();

    // initialize camera controller
    _initCamController();
  }

  @override
  dispose() {
    // Dispose of the controller when the widget is disposed.
    _camController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // set alignment
      alignment: Alignment.topCenter,

      // child is a FutureBuilder, which lets us know when the camera is ready
      child: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          // if the Future is not yet complete, show a loading indicator
          if (snapshot.connectionState == ConnectionState.done &&
              _isCameraReady) {
            // if the Future is complete, show the camera preview
            return CameraPreview(_camController);
          } else {
            // otherwise, show a loading indicator
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
