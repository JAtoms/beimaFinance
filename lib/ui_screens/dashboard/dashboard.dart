
import 'package:flutter/material.dart';

import '../components/bottom_nav_widget.dart';
import 'history_screen/history_screen.dart';
import 'home_screen/home_screen.dart';
import 'plans_screen/plan_screen.dart';
import 'profile_screen/profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final bottomPages = const [
    HomeScreen(),
    PlanScreen(),
    HistoryScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ValueListenableBuilder(
          valueListenable: pagePosition,
          builder: (context, int value, child) {
            return Scaffold(
              backgroundColor: Colors.black,
              bottomNavigationBar: const BottomNavigation(),
              body: bottomPages[value],
            );
          }),
    );
  }
}
