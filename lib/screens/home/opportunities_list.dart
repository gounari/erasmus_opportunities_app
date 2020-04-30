import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:erasmusopportunitiesapp/models/opportunity.dart';

import 'opportunity_screen.dart';

class OpportunitiesList extends StatelessWidget {

  final List<Opportunity> opportunities;
  OpportunitiesList({this.opportunities, UniqueKey key});

  @override
  Widget build(BuildContext context) {
    if (opportunities != null && opportunities.isNotEmpty) {
      return ListView.builder(
        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
        itemCount: opportunities.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () =>
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          OpportunityScreen(
                            opportunity: opportunities[index],
                          )
                  ),
                ),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                  height: 180.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(100.0, 15.0, 20.0, 20.0),
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
                                  width: 180.0,
                                  child: Text(
                                    opportunities[index].title.toString()
                                        .trim(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0,),
                            RichText(
                              text: TextSpan(
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .body1,
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2.7),
                                      child: Icon(Icons.location_on,
                                        color: Colors.blueGrey, size: 11.7,),
                                    ),
                                  ),
                                  TextSpan(text: '' +
                                      opportunities[index].venueCountry),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              "Deadline: " + opportunities[index].getDeadline(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              "Start date: " + opportunities[index].getStartDate(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 30.0,
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .accentColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                  opportunities[index].getPreviewType()),
                            ),
                            SizedBox(width: 10.0,),
                            Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .accentColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(opportunities[index]
                                  .getPreviewParticipationCost()),
                            ),
                            SizedBox(width: 10.0,),
                            Container(
                              width: 65.0,
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .accentColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                  opportunities[index].getPreviewDuration()),
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
                      child: opportunities[index].coverImage != null ?
                            Image.network(
                              opportunities[index].coverImage,
                              width: 110.0,
                              fit: BoxFit.cover,
                            ) :
                            Image(
                              width: 110.0,
                              image: AssetImage(opportunities[index].getRandomImage()),
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
    } else if (opportunities == null) {
      return Center(
          child: CircularProgressIndicator()
      );
    }

    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'There are no opportunities that match your search filters.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/page_not_found.png'),
                    fit: BoxFit.fill
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
