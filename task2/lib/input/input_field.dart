import '../listdata/mapList2.dart';
import '../services/inputpass.dart';
import 'package:task/map_value.dart';
import 'package:flutter/material.dart';
// ignore_for_file: use_build_context_synchronously

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

  // List localDB.taskInput = [];
  final _userService = UserService();

  addTask() async {
    var user = UserInput();
    user.firstName = inputFieldOne.text;
    user.lastName = inputFieldTwo.text;
    user.emailid = inputFieldThree.text;
    user.mobileNumber = inputFieldFour.text;
    await _userService.SaveUser(user);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const ListMapValues();
    }));
    inputFieldOne.text = '';
    inputFieldTwo.text = '';
    inputFieldThree.text = '';
    inputFieldFour.text = '';
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
                  labelText: 'FirstName',
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
                  labelText: 'LastName',
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
                  labelText: 'Emailid',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: '',
                ),
                // keyboardAppearance:  ,
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
                  labelText: 'MobileNumber',
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ListMapValues();
                  }));
                },
                child: const Text('View Value'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
