import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:erasmusopportunitiesapp/screens/opportunity_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
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
                                width: 120.0,
                                child: Text(
                                  'Title bluuh bluhh bluhh bluhh',
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
                            'Location',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
