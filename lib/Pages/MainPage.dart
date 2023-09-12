import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Utils/toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import 'Camera.dart';
import 'Gallary.dart';
import 'Profiles.dart';

import '../Utils/handleDrag.dart';
import '../Utils/toast.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  //create state
  @override
  _MainPageState createState() => _MainPageState();
}

const mainPageFontSize = 30.0;

class _MainPageState extends State<MainPage> {  
  bool menuOpen = false;
  bool isDragging = false;

  Dragger dragger = Dragger();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void navigateTo(var page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void handleVerticalDragEnd() {
    dragger.handleDragEnd(() {
      navigateTo(Camera());
    }, () {
      navigateTo(Gallary());
    }, 100.0);
  }

  void handleHorizonDragEnd() {
    dragger.handleDragEnd(() {
      _scaffoldKey.currentState!.openDrawer();
    }, () {
      _scaffoldKey.currentState!.openEndDrawer();
    }, 50.0);
  }

  void toggleMenu(bool menuState) {
    setState(() {
      menuOpen = menuState;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double windowWidth = MediaQuery.of(context).size.width;
    final double windowHeight = MediaQuery.of(context).size.height - 81;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('SIP Camera'),
      ),
      drawer: const Drawer(child: Profiles()),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          // a column contains 2 roundrect with different color and a text
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              dragger.getDragDistance() >= 0 ? DragBox(
                str: 'Drag UP to Camera',
                backgroundColor: isDragging ? const Color.fromARGB(0xff, 0x1c, 0x1c, 0x1c) : Colors.red,
                width: isDragging ? windowWidth : 300,
                height: isDragging ? windowHeight : 200) : const SizedBox.shrink(),

              dragger.getDragDistance() <= 0 ? DragBox(str: 'Drag DOWN to Gallary',
                backgroundColor: isDragging ? const Color.fromARGB(0xff, 0x1c, 0x1c, 0x1c) : Colors.blue,
                width: isDragging ? windowWidth : 300,
                height: isDragging ? windowHeight : 200) : const SizedBox.shrink(),
            ],
          ),
        ),

        onHorizontalDragStart: (details) {
          dragger.handleDragStart(details.globalPosition.dx);
        },

        onHorizontalDragUpdate: (details) {
          print("==>${dragger.getDragDistance()}");
          dragger.handleDragUpdate(details.globalPosition.dx);
        },

        onHorizontalDragEnd: (details) {
          handleHorizonDragEnd();
        },

        onVerticalDragStart: (details) {
          setState(() {
            isDragging = true;
          });
          dragger.handleDragStart(details.globalPosition.dy);
        },

        onVerticalDragUpdate: (details) {
          dragger.handleDragUpdate(details.globalPosition.dy);
        },

        onVerticalDragEnd: (details) {
          setState(() {
            isDragging = false;
          });
          handleVerticalDragEnd();
        },
      ),
    );
  }
}

class DragBox extends StatelessWidget {
  DragBox({
    Key? key,
    required this.str,
    required this.backgroundColor,
    required this.width,
    required this.height,
  }) : super(key: key);

  String str;
  Color backgroundColor;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            str,
            style: const TextStyle(
              fontSize: mainPageFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      )
    );
  }
}
