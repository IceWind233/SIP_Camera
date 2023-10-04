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
  final double defaultBoxWidth = 300;
  final double defaultBoxHeight = 200;
  double boxWidth = 300;
  double boxHeight = 200;

  bool menuOpen = false;
  bool isDragging = false;

  final bodyColor = const Color.fromARGB(0xff, 0x1c, 0x1c, 0x1c);

  final List<Color> defaultBoxColor = [
    const Color.fromARGB(0xff, 0xf4, 0x42, 0x35),
    const Color.fromARGB(0xff, 0x22, 0x96, 0xf3)
  ];
  List<Color> boxColor = [
    const Color.fromARGB(0xff, 0xf4, 0x42, 0x35),
    const Color.fromARGB(0xff, 0x22, 0x96, 0xf3)
  ];

  Dragger dragger = Dragger();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  List<int> getColorDiff(Color curColor, Color defaultColor) {
    return [
      curColor.red - defaultColor.red,
      curColor.green - defaultColor.green,
      curColor.blue - defaultColor.blue
    ];
  }

  Color caculateColor(Color defaultColor, List<int> colorDiff, double dragRatio) {
    return Color.fromARGB(
      0xff,
      (defaultColor.red + colorDiff[0] * dragRatio).toInt(),
      (defaultColor.green + colorDiff[1] * dragRatio).toInt(),
      (defaultColor.blue + colorDiff[2] * dragRatio).toInt(),
    );
  }

  
  void resetDragBox() {
    setState(() {
      boxWidth = defaultBoxWidth;
      boxHeight = defaultBoxHeight;
      boxColor[0] = defaultBoxColor[0];
      boxColor[1] = defaultBoxColor[1];
    });
  }

  void navigateTo(var page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page)
    ).then((value) {
      resetDragBox();
    });
  }

  void handleVerticalDragEnd() {
    dragger.handleDragEnd(() {
      navigateTo(Camera());
    }, () {
      navigateTo(Gallary());
    }, 100.0);
  }

  @override
  Widget build(BuildContext context) {
    final double windowWidth = MediaQuery.of(context).size.width;
    final double windowHeight = MediaQuery.of(context).size.height - 81;

    void setDragBox() {
      final distance = dragger.getDragDistance();
      final dragRatio = distance / windowHeight;
      final widthDiff = windowWidth - defaultBoxWidth;
      final heightDiff = windowHeight - defaultBoxHeight;

      final List<List<int>> colorDiff = [
        getColorDiff(boxColor[0], bodyColor),
        getColorDiff(boxColor[1], bodyColor),
      ];

      setState(() {
        boxColor[0] = caculateColor(boxColor[0], colorDiff[0], dragRatio);
        boxColor[1] = caculateColor(boxColor[1], colorDiff[1], dragRatio);
        boxWidth = defaultBoxWidth + (widthDiff * dragRatio).abs();
        boxHeight = defaultBoxHeight + (heightDiff * dragRatio).abs();
      });
    }

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
                backgroundColor: boxColor[0],
                width: boxWidth,
                height: boxHeight) : const SizedBox.shrink(),

              dragger.getDragDistance() <= 0 ? DragBox(
                str: 'Drag DOWN to Gallary',
                backgroundColor: boxColor[1],
                width: boxWidth,
                height: boxHeight) : const SizedBox.shrink(),
            ],
          ),
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
          setState(() {
            isDragging = true;
          });
          dragger.handleDragStart(details.globalPosition.dy);
        },

        onVerticalDragUpdate: (details) {
          dragger.handleDragUpdate(details.globalPosition.dy);
          setDragBox();
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
      duration: const Duration(milliseconds: 5),
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
