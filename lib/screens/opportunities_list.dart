import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erasmusopportunitiesapp/helpers/opportunity_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erasmusopportunitiesapp/models/opportunity.dart';

import 'opportunity_screen.dart';

class OpportunitiesList extends StatefulWidget {
  @override
  _OpportunitiesListState createState() => _OpportunitiesListState();
}

class _OpportunitiesListState extends State<OpportunitiesList> {
  @override
  Widget build(BuildContext context) {

    final oppFields = FirebaseOpportunityConstants();
    final oppDocuments = Provider.of<QuerySnapshot>(context).documents;
    var opportunities = new List(oppDocuments.length);

    for (int i = 0; i < oppDocuments.length; i++) {
      opportunities[i] = Opportunity(
        oid: oppDocuments[i].documentID,
        title: oppDocuments[i][oppFields.title],
        organisationName: oppDocuments[i][oppFields.organisationName],
        organisationUID: oppDocuments[i][oppFields.organisationUID],
        venueLocation: oppDocuments[i][oppFields.venueLocation],
        type: oppDocuments[i][oppFields.type],
        startDate: oppDocuments[i][oppFields.startDate].toDate(),
        endDate: oppDocuments[i][oppFields.endDate].toDate(),
        lowAge: oppDocuments[i][oppFields.lowAge],
        highAge: oppDocuments[i][oppFields.highAge],
        topic: oppDocuments[i][oppFields.topic],
        applicationDeadline: oppDocuments[i][oppFields.applicationDeadline].toDate(),
        participationCost: oppDocuments[i][oppFields.participationCost].toDouble(),
        reimbursementLimit: oppDocuments[i][oppFields.reimbursementLimit].toDouble(),
        applicationLink: oppDocuments[i][oppFields.applicationLink],
        provideForDisabilities: oppDocuments[i][oppFields.provideForDisabilities],
        description: oppDocuments[i][oppFields.description],
      );
    }

    return ListView.builder(
      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
      itemCount: opportunities.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => OpportunityScreen(
                  opportunity: opportunities[index],
                )
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 150.0,
                                child: Text(
                                  opportunities[index].title.toString().trim(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.red[500],
                                size: 30.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            opportunities[index].topic,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.body1,
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2.7),
                                    child: Icon(Icons.location_on, color: Colors.blueGrey, size: 11.7,),
                                  ),
                                ),
                                TextSpan(text: '' + opportunities[index].venueLocation),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(opportunities[index].getPreviewType()),
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            width: 70.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(opportunities[index].getPreviewParticipationCost()),
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            width: 70.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(opportunities[index].getPreviewDuration()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20.0,
                top: 15.0,
                bottom: 15.0,
                child: Hero(
                  tag: opportunities[index].oid,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      width: 110.0,
                      image: AssetImage(opportunities[index].image),
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
