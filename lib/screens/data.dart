import 'dart:async';
import 'dart:developer';

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
  late final FirebaseDatabase dbReference;
  late DatabaseReference _cryptoRef;

  @override
  void initState() {
    super.initState();
    dbReference = FirebaseDatabase(
        databaseURL:
            "https://auth-2bbc5-default-rtdb.europe-west1.firebasedatabase.app");
    _cryptoRef = dbReference
        .reference()
        .child('crypto')
        .child('0')
        .child('data')
        .child('BTC')
        .child('quote');
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
          Flexible(
            child: FirebaseAnimatedList(
              shrinkWrap: true,
              query: _cryptoRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                print('here');
                print(index);
                // print(snapshot);
                inspect(snapshot);
                return Container();
              },
            ),
          ),
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
