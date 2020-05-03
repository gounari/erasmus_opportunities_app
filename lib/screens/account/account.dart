import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:erasmusopportunitiesapp/models/volunteer.dart';
import 'package:erasmusopportunitiesapp/screens/home/opportunities_list.dart';
import 'package:erasmusopportunitiesapp/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Volunteer>(context);
    final volunteersData = Provider.of<VolunteerData>(context);
    final opportunities = Provider.of<List<Opportunity>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo_white.png', scale: AppBar().preferredSize.height / 8,),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/ligin.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30.0,),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    'Here you can find short \nterm opportunities',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  FlatButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                OpportunitiesList(volunteer: user, opportunities: opportunities,),
                        ),
                      );
                    },
                    child: Text(
                      "Browse liked opportunities >",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
