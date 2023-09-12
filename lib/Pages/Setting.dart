import 'package:flutter/material.dart';

class Setting extends StatefulWidget{

  @override
  _SettingState createState() => _SettingState();
}

// TODO: 1. Select quliaity of the image
// TODO: to be continued

class _SettingState extends State<Setting>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SIP Camera')),
      body: const Column(
        children: [
          Text('This is the Setting Page'),
        ],
      )
    );
  }
}