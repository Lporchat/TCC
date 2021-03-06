import 'package:dashboard/components/app_drawer/create_drawer_item.dart';
import 'package:dashboard/screens/dashboard_screen.dart';
import 'package:dashboard/screens/home_screen.dart';
import 'package:dashboard/screens/programs_screen.dart';
import 'package:dashboard/screens/projects/projects_screen.dart';
import 'package:dashboard/screens/providers/providers_screem.dart';
import 'package:dashboard/screens/tech/tech_screem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_drawer/create_header.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createHeader(),
          // CreateDrawerGroup(
          //   [
          //     CreateDrawerGroupItem(
          //       isExpanded: true,
          //       header: "Administração",
          //       iconpic: Icon(Icons.home),
          //       body: [
          //         CreateDrawerItem(
          //           icon: Icons.contacts,
          //           text: 'Contacts',
          //         ),
          //         CreateDrawerItem(
          //           icon: Icons.contacts,
          //           text: 'Contacts',
          //         ),
          //         CreateDrawerItem(
          //           icon: Icons.contacts,
          //           text: 'Contacts',
          //         ),
          //         CreateDrawerItem(
          //           icon: Icons.contacts,
          //           text: 'Contacts',
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          CreateDrawerItem(
              faIcon: FaIcon(FontAwesomeIcons.cubes),
              text: 'Dashbord',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                );
              }),

          CreateDrawerItem(
              faIcon: FaIcon(FontAwesomeIcons.cubes),
              text: 'Projetos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProjectsScreen(),
                  ),
                );
              }),

          CreateDrawerItem(
            faIcon: FaIcon(FontAwesomeIcons.truck),
            text: 'Fornecedores',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProvidersScreem(),
                ),
              );
            },
          ),
          CreateDrawerItem(
            faIcon: FaIcon(FontAwesomeIcons.userPlus),
            text: 'Técnicos Responsáveis',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => TechScreem(),
                ),
              );
            },
          ),
          /*     CreateDrawerItem(
            faIcon: FaIcon(FontAwesomeIcons.thList),
            text: 'Programas',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProgramsScreen(),
                ),
              );
            },
          ),*/
          ListTile(
            title: Text('1.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
