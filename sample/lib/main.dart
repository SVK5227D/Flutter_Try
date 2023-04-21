import 'button.dart';
import 'package:flutter/material.dart';

void main() => {runApp(const MyApp())};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AppBar(
      //   title: const Text('Sample'),
      // ),

      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Button'),
          ),
          drawer: Drawer(
            child: ListView(
              children: const <Widget>[
                DrawerHeader(
                  child: Text('Text1'),
                ),
                ListTile(
                  title: Text('1'),
                ),
                ListTile(
                  title: Text("All Mail Inboxes"),
                  leading: Icon(Icons.mail),
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text("Primary"),
                ),
                ListTile(
                  title: Text("Social"),
                ),
                ListTile(
                  title: Text("Promotions"),
                ),
              ],
            ),
          ),
          body: const ButtonPage(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          )),
    );
  }
}
