import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'SampleField One',
              hintText: 'Sample field',
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Icon(Icons.add))
        ],
      ),
    );
  }
}
