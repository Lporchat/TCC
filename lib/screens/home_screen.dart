import 'package:dashboard/components/app_drawer.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DashboardScreen();
  }
}
