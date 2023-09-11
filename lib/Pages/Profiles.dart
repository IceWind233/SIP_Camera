import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Components/UserHeader.dart';
import '../Components/UserList.dart';

// a float window with text "Profile" and background color is yellow
class Profiles extends StatelessWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.maxFinite,
            decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(255, 13, 17, 23),
            Color.fromARGB(255, 40, 44, 52),
          ],
        ),
      ),
      child: Column(children: [
        const UserHeader(),
        UserList(),
      ],)
    );
  }
}
