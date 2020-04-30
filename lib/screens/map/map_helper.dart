import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:erasmusopportunitiesapp/screens/map/map.dart';
import 'package:erasmusopportunitiesapp/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MapHelperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Opportunity>>.value(
      value: DatabaseService().opportunities,
      child: MapScreen(),
    );
  }
}

