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
            Container(
              padding: const EdgeInsets.only(left: 90, right: 90, top: 12),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('OutlinedButton'),
              ),
            ),
            Image.asset('images/sample.jpeg')
          ],
        ),
      ),
    );
  }
}
