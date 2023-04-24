import 'package:flutter/material.dart';

class FieldsView extends StatelessWidget {
  const FieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
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
        
      ]),
    );
  }
}
