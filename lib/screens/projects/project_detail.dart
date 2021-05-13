import 'package:dashboard/components/app_drawer.dart';
import 'package:dashboard/components/floor_card.dart';
import 'package:dashboard/components/project_detail_card.dart';
import 'package:flutter/material.dart';

import 'project_form_screen.dart';

class ProjectDetailScreen extends StatefulWidget {
  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  String titulo;

  @override
  Widget build(BuildContext context) {
    // operation();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                //
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProjectFormScreen(),
                  ),
                );
              }),
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ],
        title: Text("Nome do Projeto"),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          ProjectDetailCard(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                FloorCard(),
                FloorCard(),
                FloorCard(),
                FloorCard(),
                FloorCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
