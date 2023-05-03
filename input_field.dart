import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputField();
}

class _InputField extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('InputField'), centerTitle: true),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 45, top: 30, right: 45),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Input1',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: '',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 45, top: 10, right: 45),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Input2',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
