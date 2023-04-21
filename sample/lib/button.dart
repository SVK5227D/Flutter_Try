import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 25, right: 15),
              child: const TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'SampleFirld One',
                  hintText: 'Enter Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 15),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'SampleFirld One',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: TextButton(
                onPressed: () {},
                child: const Text('TextButton'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 90, right: 90, top: 12),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
