// import 'package:task/map_value.dart';
// import 'package:flutter/material.dart';
// import 'package:task/services/inputpass.dart';

// class ListMapValues extends StatefulWidget {
//   const ListMapValues({super.key});

//   @override
//   State<ListMapValues> createState() => _ListMapValuesState();
// }

// class _ListMapValuesState extends State<ListMapValues> {
//   List<UserInput> _userList = [];
//   final _userServicesList = UserService();

//   readValueTable() async {
//     var value = await _userServicesList.readValue();
//     _userList = <UserInput>[];
//     value.forEach((userValue) {
//       setState(() {
//         var userValuelist = UserInput();
//         userValuelist.firstName = userValue['firstName'];
//         userValuelist.lastName = userValue['lastName'];
//         userValuelist.emailid = userValue['emailid'];
//         userValuelist.mobileNumber = userValue['mobileNumber'];
//         _userList.add(userValuelist);
//       });
//     });
//   }

//   @override
//   void initState() {
//     readValueTable();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView.builder(
//         itemCount: _userList.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
//             color: Colors.teal[100],
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // const Padding(padding: EdgeInsets.only(left: 85)),
//                 Text(
//                   'First Name : ${_userList[index].firstName ?? ''}',
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.w400),
//                 ),
//                 Text(
//                   'Last Name : ${_userList[index].lastName ?? ''}',
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.w400),
//                 ),
//                 Text(
//                   'Emailid : ${_userList[index].emailid ?? ''}',
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.w400),
//                 ),
//                 Text(
//                   'Mobile Number : ${_userList[index].mobileNumber ?? ''}',
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.w400),
//                 ),

//                 Row(
//                   // crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.edit),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         //remove the item at the current index
//                         // setState(() {
//                         //   localDB.taskInput.removeAt(index);
//                         // });
//                         // localDB.updateData();
//                       },
//                       icon: const Icon(Icons.delete),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
