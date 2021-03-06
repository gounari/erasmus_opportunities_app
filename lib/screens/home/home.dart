import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:erasmusopportunitiesapp/models/volunteer.dart';
import 'package:erasmusopportunitiesapp/screens/home/opportunity_list_filters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:erasmusopportunitiesapp/services/database.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Volunteer>(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo_white.png', scale: AppBar().preferredSize.height / 8,),
      ),
      body: MultiProvider(
        providers: [
          StreamProvider<VolunteerData>.value(
              value: DatabaseService(uid: user == null ? null : user.uid).volunteerData,
          ),
          StreamProvider<List<Opportunity>>.value(
              value: DatabaseService().opportunities
          ),
        ],
        child: OpportunityListFilters(),
      ),
    );
  }
}
