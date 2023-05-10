import 'package:task/map_value.dart';
import 'package:flutter/material.dart';
import 'package:task/services/inputpass.dart';

class ViewTable extends StatefulWidget {
  const ViewTable({super.key});

  @override
  State<ViewTable> createState() => _ViewTableState();
}

class _ViewTableState extends State<ViewTable> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(
              top: 30,
            )),
            SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: FittedBox(
              fit: BoxFit.fitWidth,
              child: DataTable(
                border: TableBorder.all(),
                columns: const [
                  DataColumn(label: Text('FirstName')),
                  DataColumn(label: Text('LastName')),
                  DataColumn(label: Text('EmailID')),
                  DataColumn(label: Text('MobileNumber')),
                ],
                rows: _userList
                    .map(
                      (data) => DataRow(
                        cells: [
                          DataCell(Text(data.firstName!)),
                          DataCell(Text(data.lastName!)),
                          DataCell(Text(data.emailid!)),
                          DataCell(Text(data.mobileNumber!)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ))
          ],
        ));
  }
}
