import 'form.dart';
import 'list.dart';
import 'fields.dart';
import 'button.dart';
import 'selectButton.dart';
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

      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Sample'),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.text_fields), text: "InputFields"),
              Tab(icon: Icon(Icons.tab_outlined), text: "Alert"),
              Tab(icon: Icon(Icons.smart_button_outlined), text: "Button"),
              Tab(icon: Icon(Icons.list), text: "ListView"),
              // Tab(icon: Icon(Icons.list_alt_sharp), text: "LongListView"),
              Tab(icon: Icon(Icons.smart_button), text: "Button"),
            ]),
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
          body: const TabBarView(
            children: [
              FieldsView(),
              FormWigets(),
              ButtonPage(),
              ListBulid(),
              SelectButton(),
              // LongListView(
              //   sampleText: ['Sample Text1', 'Sample Text2'],
              //   // sampleText: List<String>.generate(50, (i) => "Product List: $i"),
              // ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          // bottomNavigationBar: BottomNavigationBar(
          //   items: const [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.search),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.account_circle),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
