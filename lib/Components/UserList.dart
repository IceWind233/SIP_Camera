import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

void handleSetting() {
  if (kDebugMode) {
    print('Setting');
  }
}

void handleFAQ() {
  if (kDebugMode) {
    print('FAQ');
  }
}

Future<void> handleAbout() async {
  // open url using url_launcher
  final url = Uri.parse('https://www.github.com');
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}

class UserList extends StatelessWidget {
  // a list contains Setting, FAQ, About
  final List<String> _userList = ['Setting', 'FAQ', 'About'];
  // a list Widget contains Setting, FAQ, About
  Widget build(BuildContext context) {
    // a list with 3 items and icon
    return SizedBox(
      width: double.maxFinite,
      height: 400,
      child: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.settings),
            title: Text(_userList[index]),
            onTap: () {
              switch (index) {
                case 0:
                  handleSetting();
                  break;
                case 1:
                  handleFAQ();
                  break;
                case 2:
                  handleAbout();
                  break;
                default:
                  break;
              }
            },
          );
        },
      ),
    );
  }

}