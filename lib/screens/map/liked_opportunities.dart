import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:erasmusopportunitiesapp/screens/home/opportunities_list.dart';
import 'package:flutter/cupertino.dart';

class LikedOpportunities extends StatefulWidget {

  final List<Opportunity> opportunities;
  LikedOpportunities({this.opportunities, UniqueKey key});

  @override
  _LikedOpportunitiesState createState() => _LikedOpportunitiesState();
}

class _LikedOpportunitiesState extends State<LikedOpportunities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OpportunitiesList(opportunities: widget.opportunities,),
    );
  }
}
