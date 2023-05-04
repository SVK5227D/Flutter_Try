import 'data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore_for_file: must_be_immutable

class MainPage extends StatefulWidget {
  List<dynamic> input = [];
  MainPage(
    this.input, {
    super.key,
  });
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var textChangeEdit = TextEditingController();
  late int editTextIndex;
  bool isEditing = false;
  // Hive
  final _taskBox = Hive.box('taskBox');
  TaskDataBase db = TaskDataBase();

  void _filterTodo(String searchValue) {
    List<dynamic> searchResult = [];
    if (searchValue.isEmpty) {
      searchResult = widget.input;
    } else {
      searchResult = widget.input
          .where(
              (item) => item.toLowerCase().contains(searchValue.toLowerCase()))
          .toList();
    }
    setState(() {
      widget.input = searchResult;
    });
  }

  void editTextCall(index) {
    setState(() {
      textChangeEdit.text = widget.input[index];
      isEditing = true;
      editTextIndex = index;
    });
  }

  void updateValue() {
    setState(() {
      widget.input[editTextIndex] = textChangeEdit.text;
      isEditing = false;
      Navigator.of(context).pop();
      textChangeEdit.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListData'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Box
          searchBox(),
          Expanded(
            // Showing the task using editTextIndexlist View
            child: ListView.builder(
              itemCount: widget.input.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  color: Colors.teal[100],
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 25)),
                      Text(
                        widget.input[index],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Changing the task name
                              showPopUp();
                              editTextCall(index);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              //remove the item at the current index
                              setState(() {
                                widget.input.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.table_bar),
      ),
    );
  }

  // Search field
  Widget searchBox() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 45, right: 45),
      child: TextField(
        onChanged: (value) => _filterTodo(value),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  showPopUp() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Card(
            color: Colors.transparent,
            child: TextField(
              controller: textChangeEdit,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  updateValue();
                },
                child: const Text('Update')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'))
          ],
        ),
      );
}
