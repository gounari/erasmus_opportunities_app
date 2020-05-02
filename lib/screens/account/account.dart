import 'package:erasmusopportunitiesapp/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton.icon(
        onPressed: () async {
          await _auth.signOut();
        },
        icon: Icon(
          Icons.exit_to_app,
          color: Color.fromRGBO(0, 68, 148, 1),
        ),
        label: Text(''),
      ),
    );
  }
}
