import 'package:flutter/material.dart';

import 'package:flutter_app/Components/Select.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

// TODO : Add state management to share data;

class _SettingState extends State<Setting> {

  @override
  void initState() {
    // TODO: read data from local storage if not exist create new one
    super.initState();

  }

  @override
  void deactivate() {
    super.deactivate();

    // TODO : Save data to local storage as json file
    print("on deactivate");
  }

  void handleCamQuality(String value) {
    print(value);
  }

  void handleAfterShot(String option) {
    print(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('SIP Camera')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Select(
                title: 'Camera Quality:',
                list: const [
                  "low",
                  "medium",
                  "high",
                  "veryHigh",
                  "ultraHigh",
                  "max"
                ],
                onSelected: (value) => handleCamQuality(value)),
            Select(
                title: 'After Shot',
                list: const [
                  "Edit After Shot",
                  "Shot Only",
                ],
                onSelected: (option) => handleAfterShot(option))
          ],
        ));
  }
}
