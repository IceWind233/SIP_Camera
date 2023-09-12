import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/toast.dart';

class FaqAllert extends StatelessWidget {
  const FaqAllert({super.key});

  void handleCopyLink(String str) {
    Clipboard.setData(ClipboardData(text: str));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('FAQ'),
        content: SingleChildScrollView(
          child: ListBody(children: <Widget>[
            const Text('If you have any questions, please contact me at:'),
            const Text('https://github.com/IceWind233/SIP_Camera'),
            // a button with text "Copy Link"
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: TextButton(
                  onPressed: () {
                    handleCopyLink("https://github.com/IceWind233/SIP_Camera");
                    showToast("Copied To Clipboard");
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text("Copy Link")),
            ),
          ]),
        ));
  }
}
