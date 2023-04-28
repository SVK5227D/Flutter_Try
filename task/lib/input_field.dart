import 'inputfield_button.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  TextEditingController controller;
  VoidCallback saveInput;
  VoidCallback closeField;
  InputField({
    super.key,
    required this.controller,
    required this.saveInput,
    required this.closeField,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 200,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 85, left: 50, right: 50),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Task',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Enter task to add',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: saveInput),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Cancel", onPressed: closeField),

                const SizedBox(width: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
