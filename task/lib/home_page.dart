import 'task_list.dart';
import 'input_field.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Viewdata extends StatefulWidget {
  const Viewdata({super.key});
  @override
  State<Viewdata> createState() => _ViewdataState();
}

class _ViewdataState extends State<Viewdata> {
  final _controller = TextEditingController();
  List taskInput = [
    ["Task1", false],
    ["Task2", false],
  ];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      taskInput[index][1] = !taskInput[index][1];
    });
  }

  void saveTaskList() {
    if (_controller.text.isEmpty) {
      // Fluttertoast.showToast(
      //   msg: 'Field is Empty',
      //   gravity: ToastGravity.CENTER,
      //   fontSize: 25,
      //   backgroundColor: Colors.red,
      // );
    } else {
      setState(() {
        taskInput.add(
          [_controller.text, false],
        );
      });
      _controller.text = '';
      Navigator.of(context).pop();
    }
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return InputField(
          controller: _controller,
          saveInput: saveTaskList,
          closeField: () => Navigator.of(context).pop(),
        );
        // print(taskInput.length);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data List'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: TaskSearch(taskInput));
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),

        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.search),
        //   )
        // ],
        body: ListView.builder(
          itemCount: taskInput.length,
          itemBuilder: (context, index) {
            return TaskList(
              taskName: taskInput[index][0],
              taskStatus: taskInput[index][1],
              onchange: (value) => checkBoxChange(value, index),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addNewTask,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TaskSearch extends SearchDelegate {
  final List taskInput;
  TaskSearch(this.taskInput);

  // List search = taskInput;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ListView.builder(
      itemCount: taskInput.length,
      itemBuilder: (context, index) {
        final search = taskInput[index];
        
        return ListTile(
          title: Text(taskInput[index][0]),
        );
      },
    );
  }
}
