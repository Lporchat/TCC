import 'package:dashboard/components/app_drawer.dart';
import 'package:dashboard/components/project_card.dart';
import 'package:dashboard/models/projects/project.dart';
import 'package:dashboard/screens/projects/project_detail.dart';
import 'package:dashboard/screens/projects/project_edited.dart';
import 'package:dashboard/screens/projects/project_floors_editor.dart';
import 'package:dio/dio.dart';
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

  refresh() {
    print("foi deletado");
    setState(() {});
  }

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
      body: FutureBuilder(
        future: getAllprojects(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(snapshot.data.length, (index) {
                return ProjectCard(
                    title: snapshot.data[index].titulo,
                    volume: snapshot.data[index].volume,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProjectDetailScreen(
                            id: snapshot.data[index].id,
                            img: snapshot.data[index].img,
                            pavimentos: snapshot.data[index].pavimentos,
                            titulo: snapshot.data[index].titulo,
                            volume: snapshot.data[index].volume,
                            obs: snapshot.data[index].obs,
                          ),
                        ),
                      );
                    },
                    onLongPress: () {
                      _showEditor(
                        context,
                        refresh,
                        snapshot.data[index].id,
                        snapshot.data[index].img,
                        snapshot.data[index].pavimentos,
                        snapshot.data[index].titulo,
                        snapshot.data[index].volume,
                        snapshot.data[index].obs,
                      );
                    });
              }),
            );
          } else if (!snapshot.hasData) {
            print("carregando");
            return Center(child: Text("Carregando"));
          } else if (snapshot.hasError) {
            return Center(child: Text("Deu erro"));
          }
        },
      ),
    );
  }
}

void _showEditor(context, Function refresh, String id, String img,
    int pavimentos, String titulo, int volume, String obs) {
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
                                    ProjectEdited(
                                  id: id,
                                  img: img,
                                  pavimentos: pavimentos,
                                  obs: obs,
                                  titulo: titulo,
                                  volume: volume,
                                ),
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
                            showAlertDialog(context, id, refresh);
                          },
                        )),
                  ]));
            });
      });
}

showAlertDialog(BuildContext context, String id, Function refresh) {
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
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text(
              "sim",
              style: TextStyle(color: Colors.blue, fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              deleteProject(id);
              Future.delayed(const Duration(milliseconds: 1000), () {
                refresh();
              });
            },
          )
        ],
      );
    },
  );
}
