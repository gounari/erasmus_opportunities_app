import 'dart:math';

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
      body: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          Stack(
            children:  <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width/1.4,
                    child: Hero(
                      tag: widget.opportunity.oid,
                      child: Image(
                        image: AssetImage(widget.opportunity.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(pi),
                    child: Image(
                      image: AssetImage(widget.opportunity.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                icon: Icon(Icons.arrow_back),
                iconSize: 30.0,
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  padding: EdgeInsets.only(top: 220.0),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(30.0),
                      height: MediaQuery.of(context).size.height - 220.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          new BoxShadow(
                            color: Theme.of(context).primaryColor,
                            offset: new Offset(-20.0, -10.0),
                            blurRadius: 40.0
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            widget.opportunity.title.toString().trim(),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
