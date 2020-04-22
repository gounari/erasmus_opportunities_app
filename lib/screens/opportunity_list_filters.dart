import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:erasmusopportunitiesapp/widgets/MyCostumOutlineButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'opportunities_list.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';

class OpportunityListFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var _searchController = TextEditingController();
    var filtersButtonPressed = false;
    var urgentButtonPressed = false;
    var likedButtonPressed = false;
    var freeButtonPressed = false;

    final opportunities = Provider.of<List<Opportunity>>(context);
    var filteredOpportunities = opportunities;

    void _filterOpportunitiesByTitle(value) {
        filteredOpportunities = opportunities
            .where((opportunity) =>
            opportunity.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
    }

    void _filterOpportunitiesByDeadlineChosen() {
      filteredOpportunities.sort((a, b) => a.applicationDeadline.compareTo(b.applicationDeadline));
    }

    void _filterOpportunitiesByDeadlineUnchosen() {
      filteredOpportunities.sort((a, b) => a.startDate.compareTo(b.startDate));
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

                        setState(() => _filterOpportunitiesByTitle(title));
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
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        FiltersOutlineButton(
                          text: 'Filters',
                          color1: filtersButtonPressed? Theme.of(context).primaryColor : Colors.white,
                          color2: filtersButtonPressed? Colors.white : Theme.of(context).primaryColor,
                          borderColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            setState(() {
                              filtersButtonPressed = !filtersButtonPressed;
                            });
                          },
                          icon: Icons.filter_list,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  FiltersOutlineButton(
                                    text: 'Urgent',
                                    color1: urgentButtonPressed? Theme.of(context).primaryColor : Colors.white,
                                    color2: urgentButtonPressed? Colors.white : Theme.of(context).primaryColor,
                                    borderColor: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      setState(() {
                                        if (urgentButtonPressed) {
                                          _filterOpportunitiesByDeadlineUnchosen();
                                        } else {
                                          _filterOpportunitiesByDeadlineChosen();
                                        }
                                        urgentButtonPressed = !urgentButtonPressed;
                                      });
                                    },
                                    icon: Icons.whatshot,
                                  ),
                                  SizedBox(width: 10.0,),
                                  FiltersOutlineButton(
                                    text: 'Liked',
                                    color1: likedButtonPressed? Theme.of(context).primaryColor : Colors.white,
                                    color2: likedButtonPressed? Colors.white : Theme.of(context).primaryColor,
                                    borderColor: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      setState(() {
                                        likedButtonPressed = !likedButtonPressed;
                                      });
                                    },
                                    icon: Icons.favorite_border,
                                  ),
                                  SizedBox(width: 10.0,),
                                  FiltersOutlineButton(
                                    text: 'Free',
                                    color1: freeButtonPressed? Theme.of(context).primaryColor : Colors.white,
                                    color2: freeButtonPressed? Colors.white : Theme.of(context).primaryColor,
                                    borderColor: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      setState(() {
                                        freeButtonPressed = !freeButtonPressed;
                                      });
                                    },
                                    icon: Icons.money_off,
                                  ),
                                ],
                              ),
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

  OpportunityListFilters();
}
