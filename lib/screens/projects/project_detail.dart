import 'package:dashboard/components/app_drawer.dart';
import 'package:dashboard/components/floor_card.dart';
import 'package:dashboard/components/project_detail_card.dart';
import 'package:dashboard/models/floors/floors.dart';
import 'package:flutter/material.dart';

import 'project_form_screen.dart';

class ProjectDetailScreen extends StatefulWidget {
  ProjectDetailScreen(
      {this.titulo, this.id, this.img, this.volume, this.pavimentos, this.obs});
  final String id;
  final String titulo;
  final String img;
  final String obs;
  final int pavimentos;
  final int volume;
  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
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
        ],
        title: Text(
          widget.titulo,
        ),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          ProjectDetailCard(
            obs: widget.obs,
            volume: widget.volume,
          ),
          Expanded(
            child: FutureBuilder(
              future: getfloors(""),
              // ignore: missing_return
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("carregou");
                  return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(snapshot.data.length, (index) {
                      print(snapshot.data[index].pavimento);
                      print(snapshot.data[index].volume);
                      return FloorCard(
                        pavimento: snapshot.data[index].pavimento,
                        volume: snapshot.data[index].volume,
                      );
                    }),
                  );
                } else if (!snapshot.hasData) {
                  return Center(child: Text("Carregando"));
                } else if (snapshot.hasError) {
                  return Center(child: Text("Deu erro"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
