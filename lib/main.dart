import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:erasmusopportunitiesapp/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  static const String _title = 'Home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 68, 149, 1),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Favourites',
      style: optionStyle,
    ),
    Text(
      'Index 2: Urgent',
      style: optionStyle,
    ),
    Text(
      'Index 3: Messages',
      style: optionStyle,
    ),
    Text(
      'Index 4: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Theme.of(context).primaryColor,
        items: <Widget>[
          Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.favorite, color: Colors.white, size: 30),
          Icon(Icons.whatshot, color: Colors.white, size: 30),
          Icon(Icons.email, color: Colors.white, size: 30),
          Icon(Icons.account_circle, color: Colors.white, size: 30),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}