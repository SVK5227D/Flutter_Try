import 'list_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputField();
}

class _InputField extends State<InputField> {
  final inputFieldOne = TextEditingController();
  final inputFieldTwo = TextEditingController();
  final inputFieldThree = TextEditingController();
  final inputFieldFour = TextEditingController();

  List inputValue = [];

  addTask() {
    inputValue.add(inputFieldOne.text);
    inputValue.add(inputFieldTwo.text);
    inputValue.add(inputFieldThree.text);
    inputValue.add(inputFieldFour.text);
    inputFieldOne.text = '';
    inputFieldTwo.text = '';
    inputFieldThree.text = '';
    inputFieldFour.text = '';
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MainPage(inputValue);
    }));
    // return showDialog(
    //   context: context,
    //   builder: (context) {
    //     return MainPage(inputValue);
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('InputField'), centerTitle: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 45, top: 30, right: 45),
              child: TextField(
                controller: inputFieldOne,
                decoration: const InputDecoration(
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
              child: TextField(
                controller: inputFieldTwo,
                decoration: const InputDecoration(
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
            Container(
              padding: const EdgeInsets.only(left: 45, top: 10, right: 45),
              child: TextField(
                controller: inputFieldThree,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Input3',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: '',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 45, top: 10, right: 45),
              child: TextField(
                controller: inputFieldFour,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Input4',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: '',
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 20, left: 45, right: 45),
                child: ElevatedButton(
                  onPressed: () {
                    addTask();
                  },
                  child: const Text('Submit'),
                )),
            Container(
                padding: const EdgeInsets.only(top: 20, left: 45, right: 45),
                child: ElevatedButton(
                  onPressed: () {
                    if (inputValue.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'There is no value in list',
                        gravity: ToastGravity.CENTER,
                        fontSize: 25,
                        backgroundColor: Colors.red,
                      );
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MainPage(inputValue);
                      }));
                    }
                  },
                  child: const Text('View Value'),
                ))
          ],
        ),
      ),
    );
  }
}
