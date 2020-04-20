import 'package:url_launcher/url_launcher.dart';
import 'package:erasmusopportunitiesapp/widgets/Circular_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:erasmusopportunitiesapp/models/opportunity.dart';

class OpportunityScreen extends StatefulWidget {
  final Opportunity opportunity;

  OpportunityScreen({this.opportunity});

  @override
  _OpportunityScreenState createState() => _OpportunityScreenState();
}

class _OpportunityScreenState extends State<OpportunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.opportunity.oid,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(
                        color: Colors.black,
                        blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.opportunity.image),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                    size: 30.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: EdgeInsets.all(5.0),
                ),
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(20.0),
                    elevation: 12.0,
                    shape: CircleBorder(),
                    splashColor: Theme.of(context).primaryColor,
                    focusColor: Theme.of(context).primaryColor,
                    highlightColor: Theme.of(context).primaryColor,
                    hoverColor: Theme.of(context).primaryColor,
                    fillColor: Colors.white,
                    onPressed: () async {
                      print('1');
                      final url = widget.opportunity.applicationLink;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        final snackBar = SnackBar(
                          content: Text('An error accured! Please try again.'),
                          backgroundColor: Colors.red,
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Icon(
                      Icons.assignment,
                      size: 50.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  onPressed: () => print('Add to Favorites'),
                  icon: Icon(Icons.favorite_border),
                  iconSize: 35.0,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  onPressed: () => print('Share'),
                  icon: Icon(Icons.share),
                  iconSize: 35.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.opportunity.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Fee',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.opportunity.getPreviewParticipationCost(),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.opportunity.venueLocation,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Duration',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.opportunity.getPreviewDuration(),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 140.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.opportunity.description,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Start Date: ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.opportunity.getStartDate(),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'End Date: ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.opportunity.getEndDate(),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Reimbursment Limit: ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.opportunity.getReimbursementLimit(),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Organisation: ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Flexible(
                          child: Text(
                            widget.opportunity.organisationName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Organisation can provide: ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Flexible(
                          child: Text(
                            widget.opportunity.getProvideForDisabilitiesList(),
                            maxLines: 100,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
//          ContentScroll(
//            //images: widget.movie.screenshots,
//            title: 'Screenshots',
//            imageHeight: 200.0,
//            imageWidth: 250.0,
//          ),
        ],
      ),
    );
  }
}
