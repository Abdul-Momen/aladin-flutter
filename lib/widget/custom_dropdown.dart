
/*
import 'package:flutter/material.dart';

class CustomDD extends StatefulWidget {
  final List<DropdownMenuItem<dynamic>> items;
  final Function(dynamic) onChangedFn;

  const CustomDD({Key? key, required this.items, required this.onChangedFn}) : super(key: key);

  @override
  State<CustomDD> createState() => _CustomDDState();
}

class _CustomDDState extends State<CustomDD> {
  String dropdownvalue = 'Country';

  var items = [
    'Country','Bangladesh','India','China','Arob','Singapur','USA'
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.location_on_outlined),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              elevation: 0,
              value: dropdownvalue,
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.keyboard_arrow_down),
              ),
              items: items,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
*/
