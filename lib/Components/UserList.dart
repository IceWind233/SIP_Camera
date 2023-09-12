import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Pages/Setting.dart';
import '../Components/FaqAllert.dart';

class UserList extends StatelessWidget {
  // a list contains Setting, FAQ, About
  final List<String> _userList = ['Setting', 'FAQ', 'About'];
  final List listIcon = [Icons.settings, Icons.question_answer, Icons.info];

void handleSetting(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Setting()),
  );
}

Future<void> handleFAQ(BuildContext context) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return FaqAllert();
      });
}

Future<void> handleAbout() async {
  // open url using url_launcher
  final url = Uri.parse('https://github.com/IceWind233');
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}

  // a list Widget contains Setting, FAQ, About
  @override
  Widget build(BuildContext context) {
    // a list with 3 items and icon
    return SizedBox(
      width: double.maxFinite,
      height: 400,
      child: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(listIcon[index]),
            title: Text(_userList[index]),
            onTap: () {
              switch (index) {
                case 0:
                  handleSetting(context);
                  break;
                case 1:
                  handleFAQ(context);
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
