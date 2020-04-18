import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmusopportunitiesapp/screens/opportunities_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:erasmusopportunitiesapp/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().opportunities,
      child: Container(
        child: OpportunitiesList(),
      ),
    );
  }
}
