import 'package:flutter/material.dart';

import 'package:flutter_app/Components/AutoComplete.dart';

class Select extends StatelessWidget {
  const Select({
    Key? key,
    required this.title,
    required this.list,
    required this.onSelected,
    this.margin = 8,
  }) : super(key: key);

  final double margin;
  final String title;
  final List<String> list;
  final Function onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18)),
          AutoComplete(
            list: list,
            onSelected: (value) => onSelected(value),
          ),
        ],
      ),
    );
  }
}