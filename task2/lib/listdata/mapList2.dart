import '../update.dart';
import 'package:task/map_value.dart';
import 'package:flutter/material.dart';
import 'package:task/services/inputpass.dart';
// ignore_for_file: avoid_print


class ListMapValues extends StatefulWidget {
  const ListMapValues({super.key});

  @override
  State<ListMapValues> createState() => _ListMapValuesState();
}

class _ListMapValuesState extends State<ListMapValues> {
  List<UserInput> _userList = [];
  final _userServicesList = UserService();

  readValueTable() async {
    var value = await _userServicesList.readAllUsers();
    _userList = <UserInput>[];
    value.forEach((userValue) {
      setState(() {
        var userValuelist = UserInput();
        userValuelist.firstName = userValue['firstName'];
        userValuelist.lastName = userValue['lastName'];
        userValuelist.emailid = userValue['emailid'];
        userValuelist.mobileNumber = userValue['mobileNumber'];
        _userList.add(userValuelist);
      });
    });
  }

  @override
  void initState() {
    readValueTable();
    super.initState();
  }

  _deleteValue(userId) async {
    await _userServicesList.deleteUser(userId);
    readValueTable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Data'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
            color: const Color.fromARGB(255, 165, 221, 208),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Padding(padding: EdgeInsets.only(left: 85)),
                  Text(
                    'First Name : ${_userList[index].firstName ?? ''}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Last Name : ${_userList[index].lastName ?? ''}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Emailid : ${_userList[index].emailid ?? ''}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Mobile Number : ${_userList[index].mobileNumber ?? ''}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return UpdateValue(
                            user: _userList[index]
                          );
                        }));
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        print(_userList[index].id);
                        _deleteValue(_userList[index].id);
                      },
                      icon: const Icon(Icons.delete)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
