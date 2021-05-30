import 'package:dashboard/models/Providers/providers.dart';
import 'package:dashboard/screens/providers/provider_create.dart';
import 'package:dashboard/screens/providers/providers.deteil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProvidersScreem extends StatefulWidget {
  @override
  _ProvidersScreemState createState() => _ProvidersScreemState();
}

class _ProvidersScreemState extends State<ProvidersScreem> {
  refresh() {
    print("foi deletado");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fornecedores"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProviderCreate(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getAllProviders(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                String id = snapshot.data[index].id;
                String nome = snapshot.data[index].nome;
                int cnpj = snapshot.data[index].cnpj;
                return GestureDetector(
                  child: Container(
                    height: 75,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 10,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("F"),
                        ),
                        title: Text('Fornecedor: $nome'),
                        subtitle: Text(
                          'CNPJ: $cnpj',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    //  Navigator.push(context,
                    //      MaterialPageRoute(builder: (context) => DetailsPage()));
                  },
                  onLongPress: () {
                    _showEditor(context, refresh, id, nome, cnpj);
                  },
                );
              },
            );
          } else if (!snapshot.hasData) {
            return Center(child: Text("Crregando"));
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}

void _showEditor(context, Function refresh, String id, String nome, int cnpj) {
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
                                    ProviderEdited(
                                  cnpj: cnpj,
                                  id: id,
                                  nome: nome,
                                ),
                              ),
                            );
                          },
                        )),
                  ]));
            });
      });
}
