import 'home_page.dart';
import 'dynamic_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore_for_file: sort_child_properties_last

// ignore_for_file: avoid_print
// ignore_for_file: unused_import
// ignore_for_file: depend_on_referenced_packages

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController nameController = TextEditingController();

  List form = [];
  List fieldList = [];
  addListField() {
    if (fieldList.length < 3) {
      fieldList.add(const InputField());
      setState(() {});
    } else {
      Fluttertoast.showToast(
          msg: 'Morethan four input field blocked',
          gravity: ToastGravity.CENTER,
          fontSize: 25,
          backgroundColor: Colors.red);
    }
  }

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
            Flexible(
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 85, left: 50, right: 50),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Task',
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                        hintText: 'Enter task to add',
                        suffixIcon: IconButton(
                          onPressed: () {
                            addListField();
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ),
                  ),
                  // Flexible(
                  //   child: ListView.builder(
                  //     itemCount: fieldList.length,
                  //     itemBuilder: (context, index) => fieldList[index],
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text.trim();
                  nameController.text = '';
                  if (name.isNotEmpty) {
                    form.add(name);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => const Viewdata(),
                      ),
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Field is Empty',
                        gravity: ToastGravity.CENTER,
                        fontSize: 25,
                        backgroundColor: Colors.red);
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
