import 'package:erasmusopportunitiesapp/widgets/content_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Text(
                'How Ersamus+ works',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                  "Erasmus+ is the European Union programme for education, training, youth and sport. Organisations are invited to apply for funding each year for life-changing activities.\n\nErasmus+ aims to modernise education, training and youth work across Europe. It is open to education, training, youth and sports organisations across all sectors of lifelong learning, including school education, further and higher education, adult education and the youth sector. Through Erasmus+:"
              ),
              ContentScroll(
                images: [
                  'assets/images/info1.jpg',
                  'assets/images/info2.jpg',
                  'assets/images/info3.jpg',
                  'assets/images/info4.jpg'],
                title: '',
                imageHeight: 150.0,
                imageWidth: 200.0,
              ),
              Text(
                  "🤸‍️  Young people can study, volunteer and gain work experience abroad, to develop new skills, gain vital international experience and boost their employability\n‍🎓  Staff can teach or train abroad, to develop their professional practice, build relationships with international peers, and gain fresh ideas.\n🌈  Organisations can collaborate with international partners, to drive innovation, share best practice, and offer new opportunities to young people."
              ),
            ],
          ),
        ),
      ),
    );
  }
}
