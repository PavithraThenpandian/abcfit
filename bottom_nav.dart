import 'package:abc_fit/pallete.dart';
import 'package:abc_fit/screens/diet_page.dart';
import 'package:abc_fit/screens/programs.dart';
import 'package:abc_fit/screens/report_lead.dart';
import 'package:abc_fit/screens/reports.dart';
import 'package:abc_fit/screens/screen.dart';
import 'package:abc_fit/screens/week_one.dart';
import 'package:flutter/material.dart';
import './/screens/daily_plan.dart';
import './/screens/profile.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
  BottomNav();
}

class _BottomNavState extends State<BottomNav> {
  int _selectIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    WeekOne(),
    Programs(),
    Diet(),
    ReportLead(),
  ];

  void _onTapWid(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kWhite,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.calendar_view_day_rounded,
                color: Color(0xff23395d),
              ),
              icon: Icon(
                Icons.calendar_view_day_rounded,
              ),
              title: Text('Daily',
                  style: TextStyle(
                    color: Color(0xff23395d),
                    fontWeight: FontWeight.bold,
                  )),
              backgroundColor: kWhite,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.food_bank_rounded,
                color: Color(0xff23395d),
              ),
              icon: Icon(
                Icons.food_bank_rounded,
              ),
              title: Text('Diet',
                  style: TextStyle(
                    color: Color(0xff23395d),
                    fontWeight: FontWeight.bold,
                  )),
              backgroundColor: kWhite,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.auto_graph_outlined,
                color: Color(0xff23395d),
              ),
              icon: Icon(Icons.auto_graph_outlined),
              title: Text('Reports',
                  style: TextStyle(
                    color: Color(0xff23395d),
                    fontWeight: FontWeight.bold,
                  )),
              backgroundColor: kWhite,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.summarize),
            //   title: Text('Summary'),
            //   backgroundColor: color.blue,
            // ),
          ],
          currentIndex: _selectIndex,
          onTap: _onTapWid,
        ));
  }
}
