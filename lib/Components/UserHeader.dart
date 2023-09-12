import 'dart:io';

import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.maxFinite,
      height: 200,
      // contain a avatar and a text "User"
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // use icon person_fill
          const Icon(
            Icons.person,
            size: 100,
            color: Color.fromARGB(255, 100, 100, 100),
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