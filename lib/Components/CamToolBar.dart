import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CamProfile extends ChangeNotifier {
  bool flashOn = false;
  bool isTakePhoto = false;
  bool isSwitchCamera = false;
  double zoomValue = 1.0;

  void setFlashOn(bool value) {
    flashOn = value;
    notifyListeners();
  }

  void setIsTakePhoto(bool value) {
    isTakePhoto = value;
    notifyListeners();
  }

  void setIsSwitchCamera(bool value) {
    isSwitchCamera = value;
    notifyListeners();
  }

  void setZoomValue(double value) {
    zoomValue = value;
    notifyListeners();
  }

  void reset() {
    flashOn = false;
    isTakePhoto = false;
    isSwitchCamera = false;
    zoomValue = 1.0;
    notifyListeners();
  }
}

class CamToolBar extends StatefulWidget {
  const CamToolBar({Key? key}) : super(key: key);

  @override
  _CamToolBarState createState() => _CamToolBarState();
}

class _CamToolBarState extends State<CamToolBar>{

  CamProfile camProfile = CamProfile();

  void handleFlashOn() {
    setState(() {
      camProfile.flashOn = !camProfile.flashOn;  
    });
    
    print('flash on');
  }

  void handleTakePhoto() {
    setState(() {
      camProfile.isTakePhoto = !camProfile.isTakePhoto;
    });
    print('take photo');
  }

  void handleSwitchCamera() {
    setState(() {
      camProfile.isSwitchCamera = !camProfile.isSwitchCamera;  
    });

    print('switch camera');
  }

  void setZoom(double value) {
    setState(() {
      camProfile.zoomValue = value;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // set width and height
        width: double.infinity,
        height: 114,
        // set child as camera preview
        child: Column(
          children: [
            Slider(
              value: camProfile.zoomValue,
              onChanged: setZoom,
              divisions: 50,
              label: camProfile.zoomValue.toStringAsFixed(1),
              min: 1,
              max: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // three buttons which are flash on and off, take photo and switch camera
              children: [
                // flash on and off
                IconButton(
                  icon: const Icon(Icons.flash_on),
                  color: const Color.fromARGB(255, 100, 100, 100),
                  onPressed: () {
                    handleFlashOn();
                  },
                ),
                // take photo
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  color: const Color.fromARGB(255, 100, 100, 100),
                  onPressed: () {
                    handleTakePhoto();
                  },
                  style: ButtonStyle(
                    iconSize: MaterialStateProperty.all(50.0),
                  ),
                ),
                // switch camera
                IconButton(
                  icon: const Icon(Icons.switch_camera),
                  color: const Color.fromARGB(255, 100, 100, 100),
                  onPressed: () {
                    handleSwitchCamera();
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
