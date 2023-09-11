import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Pages/MainPage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIP Camera',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}