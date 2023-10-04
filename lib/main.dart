
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import 'package:flutter_app/app.dart';
import 'package:flutter_app/Components/CamToolBar.dart';

//use md3 theme
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CamProfile(),
      child: const App()
    )
  );
}
