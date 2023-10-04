import 'package:flutter/material.dart';

class ImgProc extends StatefulWidget{
  const ImgProc({super.key});

  @override
  _ImgProcState createState() => _ImgProcState();
}

class _ImgProcState extends State<ImgProc>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SIP Camera')),
      body: const Column(
        children: [
          Text('This is the ImgProc Page'),
        ],
      )
    );
  }
}