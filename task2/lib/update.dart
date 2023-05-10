import '../services/inputpass.dart';
import 'package:task/map_value.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
// ignore_for_file: use_build_context_synchronously

class UpdateValue extends StatefulWidget {
  final UserInput user;
  const UpdateValue({super.key, required this.user});

  @override
  State<UpdateValue> createState() => _UpdateValue();
}

class _UpdateValue extends State<UpdateValue> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailidController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final _userService = UserService();

  @override
  void initState() {
    setState(() {
      firstNameController.text = widget.user.firstName ?? '';
      lastNameController.text = widget.user.lastName ?? '';
      emailidController.text = widget.user.emailid ?? '';
      mobileNumberController.text = widget.user.mobileNumber ?? '';
    });
    super.initState();
  }

  update() async {
    var user = UserInput();
    user.id = widget.user.id;
    user.firstName = firstNameController.text;
    user.lastName = lastNameController.text;
    user.emailid = emailidController.text;
    user.mobileNumber = mobileNumberController.text;
    var result = await _userService.UpdateUser(user);
    Navigator.pop(context, result);
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
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'FirstName',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 45, top: 10, right: 45),
              child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'LastName',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 45, top: 10, right: 45),
              child: TextField(
                controller: emailidController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Emailid',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                keyboardType: TextInputType.emailAddress,
                // inputFormatters: [FilteringTextInputFormatter.],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 45, top: 10, right: 45),
              child: TextField(
                controller: mobileNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'MobileNumber',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            // print(_userList[index].id);
            // print(_userList.indexOf(_userList[index]));
            Container(
              padding: const EdgeInsets.only(top: 20, left: 45, right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      update();
                    },
                    child: const Text('Update'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
