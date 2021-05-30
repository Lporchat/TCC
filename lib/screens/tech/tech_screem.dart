import 'package:dashboard/models/tech/tech.dart';
import 'package:flutter/material.dart';

class TechScreem extends StatefulWidget {
  @override
  _TechScreemState createState() => _TechScreemState();
}

class _TechScreemState extends State<TechScreem> {
  refresh() {
    print("foi deletado");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tecnicos"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: getAllTech(),
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
                int cpf = snapshot.data[index].cpf;
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
                          child: Text("T"),
                        ),
                        title: Text('Tecnico: $nome'),
                        subtitle: Text(
                          'Cpf: $cpf',
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
                    _showEditor(context, refresh, id, nome, cpf);
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

void _showEditor(context, Function refresh, String id, String nome, int cpf) {
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
                          onPressed: () {},
                        )),
                  ]));
            });
      });
}
