import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:erasmusopportunitiesapp/screens/map/map.dart';
import 'package:erasmusopportunitiesapp/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapHelperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Opportunity>>.value(
      value: DatabaseService().opportunities,
      child: Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/images/logo_white.png', scale: AppBar().preferredSize.height / 8,),
          ),
          body: MapScreen()
      ),
    );
  }
}

