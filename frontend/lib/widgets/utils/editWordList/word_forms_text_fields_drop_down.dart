
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class WordFormsTextFieldsDropDown extends StatefulWidget {
  final List<String> options;
  final void Function(String?) onSelected;
  final String? selected;

  const WordFormsTextFieldsDropDown({
    super.key,
    required this.options,
    required this.onSelected,
    this.selected,
  });

  @override
  State<WordFormsTextFieldsDropDown> createState() =>
      _WordFormsTextFieldsDropDownState();
}

class _WordFormsTextFieldsDropDownState
    extends State<WordFormsTextFieldsDropDown> {
  late String selectedValue;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selected ?? widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: selectedValue,
        labelStyle: const TextStyle(
          fontSize: 17,
          fontFamily: "roboto",
           fontWeight: FontWeight.w500,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 129, 154, 145), width: 1.5),
        ),
              suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right : 0.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              customButton: const Icon(Icons.arrow_drop_down),
              items: widget.options
                  .map(
          (item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: "roboto",
                color: Colors.black,
              ),
            ),
          ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
          selectedValue = value;
                  });
                  widget.onSelected(value);
                }
              },
              dropdownStyleData: DropdownStyleData( 
                decoration: const BoxDecoration(
                  color:  Color.fromARGB(255, 240, 240, 240),
                ),
                maxHeight: 150, 
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width:  MediaQuery.of(context).size.width - 10 ,
                scrollbarTheme: ScrollbarThemeData(
                  thumbVisibility: WidgetStateProperty.all(true),
                  thickness: WidgetStateProperty.all(2),
                ),
              ),
            ),
          ),
        ),
      ),
      style: const TextStyle(
        fontSize: 15,
        fontFamily: "roboto",
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}