import 'inputfield_button.dart';
import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable


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
              padding: const EdgeInsets.only(top: 55, left: 50, right: 50),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Task',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
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
