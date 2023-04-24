import 'package:flutter/material.dart';

class Cardmsg extends StatelessWidget {
  const Cardmsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: const [
          ListTile(
            title: Text('Sample Card'),
          )
        ],
      ),
    );
  }
}
