import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore_for_file: avoid_print
// ignore_for_file: unused_import
// ignore_for_file: depend_on_referenced_packages

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List form = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form',
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 43, 197, 123),
      ),
      body: Form(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 85, left: 50, right: 50),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Enter the your name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, left: 50, right: 50),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Enter the your paswword',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, left: 50, right: 50),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Emailid',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Enter the your emailid',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, left: 50, right: 50),
              child: TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Enter the your number',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 10,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text.trim();
                  String password = passwordController.text.trim();
                  String email = emailController.text.trim();
                  String number = numberController.text.trim();
                  nameController.text = '';
                  passwordController.text = '';
                  emailController.text = '';
                  numberController.text = '';
                  if (((name.isNotEmpty && password.isNotEmpty) &&
                      (email.isNotEmpty && number.isNotEmpty))) {
                    form.add({
                      'name': name,
                      'password': password,
                      'email': email,
                      'number': number
                    });
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Some fields are empty',
                        timeInSecForIosWeb: 2,
                        gravity: ToastGravity.CENTER,
                        fontSize: 15);
                  }
                  print(form);
                },
                child: const Text('Save', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
