import 'add_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AddTask());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sample'),
          centerTitle: true,
          actions: [
            const Align(
              alignment: Alignment.topRight,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTask(),
                ));
          },
          child: const Text('ADD'),
        ),
      ),
    );
  }
}
