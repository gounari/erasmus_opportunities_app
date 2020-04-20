import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'opportunities_list.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';

class OpportunityListFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var _searchController = TextEditingController();

    final opportunities = Provider.of<List<Opportunity>>(context);
    var filteredOpportunities = opportunities;

    void _filterOpportunities(value) {
        filteredOpportunities = opportunities
            .where((opportunity) =>
            opportunity.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
    }

    return StatefulBuilder(
      builder: (context, StateSetter setState) =>

        FocusWatcher(
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (title) {

                        setState(() => _filterOpportunities(title));
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              filteredOpportunities = opportunities;
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
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        OutlineButton.icon(
                          onPressed: () {  },
                          color: Colors.white,
                          textColor: Colors.white,
                          icon: Icon(Icons.filter_list),
                          label: Text('Filters',),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 10.0,),
                                OutlineButton.icon(
                                  onPressed: () {  },
                                  color: Colors.white,
                                  textColor: Colors.white,
                                  icon: Icon(Icons.whatshot),
                                  label: Text('Urgent',),
                                ),
                                SizedBox(width: 10.0,),
                                OutlineButton.icon(
                                  onPressed: () {  },
                                  color: Colors.white,
                                  textColor: Colors.white,
                                  icon: Icon(Icons.favorite_border),
                                  label: Text('Liked',),
                                ),
                                SizedBox(width: 10.0,),
                                OutlineButton.icon(
                                  onPressed: () {  },
                                  color: Colors.white,
                                  textColor: Colors.white,
                                  icon: Icon(Icons.money_off),
                                  label: Text('Free',),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: OpportunitiesList(opportunities: filteredOpportunities),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
