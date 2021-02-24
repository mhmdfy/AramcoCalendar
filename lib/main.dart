import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aramco Operational Calendar',
      home: Scaffold(
        appBar: _getGradientAppBar(),
        body: BodyPage(),
        persistentFooterButtons: [
          LegendFooter()
        ],
      ),
    );
  }

  AppBar _getGradientAppBar() {
    return AppBar(
      title: Text('Operational Calendar'),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff84bd00), Color(0xff00a3e0)],
            // stops: [0.2, 2.5],
          )
        ),
      ),
    );
  }
}

class BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [Image(image: AssetImage(_getImageString(context)))]);
  }

  String _getImageString(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    print('size is $shortestSide, use mobile is $useMobileLayout');

    if (useMobileLayout) {
      return 'assets/images/calendar-phone.png';
    } else {
      return 'assets/images/calendar-tablet.png';
    }
  }
}

class LegendFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getFooter(context);
  }

  Widget _getFooter(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;
    if (useMobileLayout) {
      return Image(image: AssetImage('assets/images/calendar-legend.png'));
    } else {
      return Container(
        height: 0,
      );
    }
    
  }

}