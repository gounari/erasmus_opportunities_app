import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'opportunities_list.dart';

class OpportunityListFilters extends StatefulWidget {
  @override
  _OpportunityListFiltersState createState() => _OpportunityListFiltersState();
}

class _OpportunityListFiltersState extends State<OpportunityListFilters> {
  @override
  Widget build(BuildContext context) {


    final opportunities = Provider.of<List<Opportunity>>(context);

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextField(
          onChanged: (title) {
            //_filterOpportunities(title, DatabaseService().opportunities);
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
      body: OpportunitiesList(opportunities: opportunities),
    );
  }
}
