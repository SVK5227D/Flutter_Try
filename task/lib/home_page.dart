import 'task_input.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables

class Viewdata extends StatefulWidget {
  const Viewdata({super.key});
  @override
  State<Viewdata> createState() => _ViewdataState();
}

class _ViewdataState extends State<Viewdata> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data List'),
          centerTitle: true,
        ),
        // body: ShowData(
        //   name: '',
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contex) => const AddTaskPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// class ShowData extends StatelessWidget {
//   ShowData({required this.name});
//   final String name;
//   List<String> inputValue = List.empty(growable: true);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(children: [
//         inputValue.add(name),
//         Text(
//           '$name',
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         )
//       ]),
//     );
//   }
// }
