import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final dbReference = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ref = dbReference.reference();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Database Example'),
      ),
      body: Column(
        children: <Widget>[
          Container(),
          ElevatedButton(
              onPressed: () {
                ref
                    .child('source')
                    .push()
                    .child('value')
                    .set('value of my choice')
                    .asStream();
              },
              child: const Text('upload data')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
