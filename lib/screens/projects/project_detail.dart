import 'package:dashboard/components/app_drawer.dart';
import 'package:dashboard/components/floor_card.dart';
import 'package:dashboard/components/project_detail_card.dart';
import 'package:dashboard/models/floors/floors.dart';
import 'package:dashboard/screens/projects/project_floors_editor.dart';
import 'package:flutter/cupertino.dart';
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
  refresh() {
    print("foi deletado");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titulo,
        ),
        centerTitle: true,
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
              future: getfloors(widget.id),
              // ignore: missing_return
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("carregou");
                  return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(snapshot.data.length, (index) {
                      return FloorCard(
                        pavimento: snapshot.data[index].pavimento,
                        volume: snapshot.data[index].volume,
                        onLongPress: () {
                          _showEditor(
                            context,
                            refresh,
                            widget.volume,
                            widget.obs,
                            widget.titulo,
                            snapshot.data[index].id,
                            snapshot.data[index].idprojeto,
                            snapshot.data[index].pavimento,
                            snapshot.data[index].descricao,
                            snapshot.data[index].volume,
                            snapshot.data[index].img,
                            snapshot.data[index].fornecedor,
                            snapshot.data[index].elementoestrutural,
                            snapshot.data[index].tecnico,
                            snapshot.data[index].nota,
                            snapshot.data[index].lacre,
                            snapshot.data[index].fck,
                            snapshot.data[index].slump,
                            snapshot.data[index].volumeaplicado,
                            snapshot.data[index].datasaidausina,
                            snapshot.data[index].datachegadaobra,
                            snapshot.data[index].datainicio,
                            snapshot.data[index].datafim,
                            snapshot.data[index].amostra1_7,
                            snapshot.data[index].amostra1_28,
                            snapshot.data[index].amostra1_63,
                            snapshot.data[index].amostra2_7,
                            snapshot.data[index].amostra2_28,
                            snapshot.data[index].amostra2_63,
                            snapshot.data[index].referencia_7,
                            snapshot.data[index].referencia_28,
                            snapshot.data[index].referencia_63,
                          );
                        },
                      );
                    }),
                  );
                } else if (!snapshot.hasData) {
                  return Center(child: Text("Carregando"));
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

void _showEditor(
    context,
    Function refresh,
    vol,
    obs,
    titulo,
    id,
    idprojeto,
    pavimento,
    descricao,
    volume,
    img,
    fornecedor,
    elemento,
    tecnico,
    nota,
    lacre,
    fck,
    slump,
    volumeaplicado,
    datasainda,
    datachegada,
    datainicio,
    datafim,
    amostra1_7,
    amostra1_28,
    amostra1_63,
    amostra2_7,
    amostra2_28,
    amostra2_63,
    referencia_7,
    referencia_28,
    referencia_63) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        print(referencia_28);
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
                                builder: (BuildContext context) => FloorsEdited(
                                  id: id,
                                  obsP: obs,
                                  volP: vol,
                                  titulo: titulo,
                                  idprojeto: idprojeto,
                                  descricao: descricao,
                                  img: img,
                                  fornecedor: fornecedor,
                                  elemento: elemento,
                                  tecnico: tecnico,
                                  nota: nota,
                                  lacre: lacre,
                                  fck: fck,
                                  slump: slump,
                                  volumeaplicado: volumeaplicado,
                                  datasainda: datasainda,
                                  datachegada: datachegada,
                                  datainicio: datainicio,
                                  datafim: datafim,
                                  amostra1_7: amostra1_7,
                                  amostra1_28: amostra1_28,
                                  amostra1_63: amostra1_63,
                                  amostra2_7: amostra2_7,
                                  amostra2_28: amostra2_28,
                                  amostra2_63: amostra2_63,
                                  refencial_7: referencia_7,
                                  refencial_28: referencia_28,
                                  refencial_63: referencia_63,
                                  pavimento: pavimento,
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
                            showAlertDialog(context, refresh, id);
                          },
                        )),
                  ]));
            });
      });
}

showAlertDialog(
  BuildContext context,
  Function refresh,
  String id,
) {
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
              deleteFloors(id);
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
