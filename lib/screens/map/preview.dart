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
            height: 170.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor,
                  spreadRadius: 0.1,
                  offset: Offset(
                    4.0, // horizontal, move right 10
                    4.0, // vertical, move down 10
                  ),
                )
              ],
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
          ),
          Positioned(
            right: 30.0,
            top: 66.0,
            child: IconButton(
              onPressed: () => print('Add to Favorites'),
              icon: Icon(Icons.favorite_border),
              iconSize: 30.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );;
  }
}
