import 'package:expense_tracking_app/pages/budget_list.dart';
import 'package:expense_tracking_app/pages/create_budget.dart';
import 'package:expense_tracking_app/pages/dashboard.dart';
import 'package:expense_tracking_app/pages/profile.dart';
import 'package:expense_tracking_app/pages/stats.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expense_tracking_app/themes/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {

  int pageIndex = 0;
  List<Widget> pages = [
    Dashboard(),
    Stats(),
    CreateBudget(),
    BudgetList(),
    Profile(),

     ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedTab(4);
            },
            child: Icon(
              Icons.add,
              size: 25,
            ),
            backgroundColor: Colors.pink
          //params
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: <Widget> [
        Text("Hi",),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      FontAwesomeIcons.calendar,
      FontAwesomeIcons.chartLine,
      FontAwesomeIcons.moneyBill,
      FontAwesomeIcons.user
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}

