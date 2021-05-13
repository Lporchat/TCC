import 'package:dashboard/components/app_drawer.dart';
import 'package:dashboard/components/project_card.dart';
import 'package:dashboard/screens/projects/project_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'project_form_screen.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String titulo;

  @override
  Widget build(BuildContext context) {
    // operation();
    return Scaffold(
      appBar: AppBar(
        title: Text("Projetos"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProjectFormScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ProjectCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProjectDetailScreen(),
                ),
              );
            },
            onLongPress: () {
              _showEditor(context);
            },
          ),
          ProjectCard(),
          ProjectCard(),
          ProjectCard(),
          ProjectCard(),
        ],
      ),
    );
  }
}

void _showEditor(context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                  padding: EdgeInsets.all(10),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          child: Text(
                            "Editar",
                            style:
                                TextStyle(color: Colors.blue, fontSize: 20.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ProjectFormScreen(),
                              ),
                            );
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          child: Text(
                            "deletar",
                            style: TextStyle(color: Colors.red, fontSize: 20.0),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            showAlertDialog(context);
                          },
                        )),
                  ]));
            });
      });
}

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Center(
          child: Text("Deletar"),
        ),
        content: Text(
            "Deseja realmente deletar o projeto ?\n\nNão e possivel defazer essa ação."),
        actions: [
          FlatButton(
            child: Text(
              "Não",
              style: TextStyle(color: Colors.blue, fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text(
              "Sim",
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
