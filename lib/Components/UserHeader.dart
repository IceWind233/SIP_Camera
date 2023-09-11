import 'dart:io';

import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File pngFile = File('../../assert/defaultUser.png');


    return Container(
      width: double.maxFinite,
      height: 200,
      // gradient color from #0D1117 to #282C34

      // contain a avatar and a text "User"
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: pngFile.existsSync() ? FileImage(pngFile) : null,
          ),
          const SizedBox(height: 10),
          const Text(
            'User',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // bottom border
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.maxFinite,
            height: 2,
            color: const Color.fromARGB(100, 13, 17, 23),
          ),
        ],
      ),
    );
  }
}