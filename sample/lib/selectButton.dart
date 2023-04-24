import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  var listSelect = ['Sample1', 'Sample2', 'Sample3', 'Sample4'];
  var currentValue = 'Sample1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            DropdownButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              items: listSelect.map((String element) {
                return DropdownMenuItem(
                  value: element,
                  child: Text(element),
                );
              }).toList(),
              onChanged: (String? userSelctValue) {
                setState(() {
                  currentValue = userSelctValue!;
                });
              },
              value: currentValue,
            ),
          ],
        ),
      ),
    );
  }
}
