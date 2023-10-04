
import 'package:flutter/material.dart';

class AutoComplete extends StatefulWidget {
  // constructor with 2 parameters which are List<string> and value list and a key 
  const AutoComplete({
    Key? key,
    required this.list,
    required this.onSelected,
  }) : super(key: key);

  final List<String> list;
  final Function onSelected;

  @override
  _AutoCompleteState createState() => _AutoCompleteState(list, onSelected);
}

class _AutoCompleteState extends State<AutoComplete> {
  // constructor with 2 parameters which are List<string> and value list
  _AutoCompleteState(this.list, this.onSelected);

  final List<String> list;
  final Function onSelected;

  void handleSelection(String value) {
    onSelected(value);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list[0],
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          label: value,
          value: value,
        );
      }).toList(),  
      onSelected: (value) {
        handleSelection(value??"");
      },
    );
  }
}