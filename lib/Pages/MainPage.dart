import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Camera.dart';
import 'Gallary.dart';
import 'Profiles.dart';

import '../Utils/handleDrag.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  //create state
  @override
  _MainPageState createState() =>  _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool menuOpen = false;
  bool isHorizontalDrag = false;
  Dragger dragger = Dragger();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void navigateTo(var page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void handleVerticalDragEnd(){
    dragger.handleDragEnd(
      () {
        navigateTo(Camera());
      },
      () {
        navigateTo(Gallary());
      },
      100.0
    );
  }

  void handleHorizonDragEnd(){
    dragger.handleDragEnd(
      () {
        _scaffoldKey.currentState!.openDrawer();
      },
      () {
        _scaffoldKey.currentState!.openEndDrawer();
      },
      50.0
    );
  }

  void toggleMenu(bool menuState) {
    setState(() {
      menuOpen = menuState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('SIP Camera'),
      ),
      drawer:  const Drawer(child: Profiles()),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: const Text('This is SIP Camera'),
        ),

        onHorizontalDragStart: (details) {
          dragger.handleDragStart(details.globalPosition.dx);
        },

        onHorizontalDragUpdate: (details) {
          dragger.handleDragUpdate(details.globalPosition.dx);
        },

        onHorizontalDragEnd: (details) {
          handleHorizonDragEnd();
        },

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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              navigateTo(Camera());
            },
            child: const Icon(Icons.camera_alt),
          ),

          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              navigateTo(Gallary());
            },
            child: const Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}