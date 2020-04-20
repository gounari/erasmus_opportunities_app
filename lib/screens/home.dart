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
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextField(
            onChanged: (value) {
            },
            style: TextStyle(color: Colors.black),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: 'Search titles',
            ),
          ),
        ),
        body: OpportunitiesList(),
      ),
    );
  }
}
