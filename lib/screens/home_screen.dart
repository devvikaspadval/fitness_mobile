import 'package:fitnessapp/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'activity_screen.dart';
import 'dashboard_screen.dart';
import 'explore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = -0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );


  decideBody(){
    switch(_selectedIndex){
      case 0:
        return DashboardScreen();
      case 1:
        return ExploreScreen();
      case 2:
        return ActivityScreen();
      case 3:
        return Text('Profile', style: optionStyle);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.colorScaffoldBackground),
      body: decideBody(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 8.0, bottom: 16.0, right: 8.0),
        width: 340,
        decoration: BoxDecoration(
          color: Color(0xff192126),
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              // rippleColor: Colors.grey[300]!,
              // hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color(AppColors.colorPrimaryGreen),
              color: Colors.white,
              tabs: [
                GButton(icon: CupertinoIcons.house_alt_fill, text: 'Home'),
                GButton(icon: CupertinoIcons.rocket_fill, text: 'Explore'),
                GButton(
                  icon: CupertinoIcons.chart_bar_square_fill,
                  text: 'Statistic',
                ),
                GButton(icon: CupertinoIcons.person_fill, text: 'Profile'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
