import 'package:flutter/material.dart';

class WordDetailsDropdown extends StatelessWidget {
  final String label;
  final List<String> options;
  final void Function(String?) onSelected;
  final String? selected;

  const WordDetailsDropdown({
    super.key,
    required this.label,
    required this.options,
    required this.onSelected,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: selected ?? options.first,
      width: double.infinity,
      onSelected: onSelected,
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 17,
          fontFamily: "roboto",
          color: Colors.black,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 129, 154, 145), width: 1.5),
        ),
      ),
      textStyle: const TextStyle(
        fontSize: 15,
        fontFamily: "roboto",
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      dropdownMenuEntries: options
          .map((value) => DropdownMenuEntry(value: value, label: value))
          .toList(),
    );
  }
}

