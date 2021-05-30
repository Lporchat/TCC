import 'package:dashboard/components/app_drawer.dart';
import 'package:dashboard/components/dashboard_card.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int projetos;
  int pavimentos;
  int corposDeProva;
  int tecnicos;
  int fornecedores;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DashboardCard(
                faIcon: FontAwesomeIcons.building,
                color: Colors.red,
                title: 'Projetos',
                data: 5,
              ),
              DashboardCard(
                title: "Pavimentos",
                faIcon: FontAwesomeIcons.layerGroup,
                color: Colors.orange,
                data: 30,
              ),
              DashboardCard(
                title: "Técnicos Responsáveis",
                faIcon: FontAwesomeIcons.usersCog,
                color: Colors.green,
                data: 10,
              ),
              DashboardCard(
                title: "Fornecedores",
                faIcon: FontAwesomeIcons.truck,
                color: Colors.blue,
                data: 20,
              ),
            ],
          ),
        ));
  }
}
