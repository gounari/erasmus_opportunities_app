import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:erasmusopportunitiesapp/screens/home/opportunity_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpportunityPreviewForMap extends StatefulWidget {
  final Opportunity opportunity;

  const OpportunityPreviewForMap({Key key, this.opportunity}) : super(key: key);
  @override
  _OpportunityPreviewForMapState createState() => _OpportunityPreviewForMapState();
}

class _OpportunityPreviewForMapState extends State<OpportunityPreviewForMap> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () =>
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    OpportunityScreen(
                      opportunity: widget.opportunity,
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
                              widget.opportunity.title.toString()
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
                                widget.opportunity.venueCountry),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Deadline: " +  widget.opportunity.getDeadline(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Start date: " +  widget.opportunity.getStartDate(),
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
                            widget.opportunity.getPreviewType()),
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
                        child: Text( widget.opportunity
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
                            widget.opportunity.getPreviewDuration()),
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
              tag:  widget.opportunity.oid,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child:  widget.opportunity.coverImage != null ?
                Image.network(
                  widget.opportunity.coverImage,
                  width: 110.0,
                  fit: BoxFit.cover,
                ) :
                Image(
                  width: 110.0,
                  image: AssetImage( widget.opportunity.getRandomImage()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );;
  }
}
