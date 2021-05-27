import 'package:dashboard/models/projects/project.dart';
import 'package:dashboard/screens/projects/projects_screen.dart';
import 'package:flutter/material.dart';

class ProjectEdited extends StatefulWidget {
  const ProjectEdited(
      {Key key,
      this.id,
      this.titulo,
      this.img,
      this.obs,
      this.pavimentos,
      this.volume})
      : super(key: key);

  final String id;
  final String titulo;
  final String img;
  final String obs;
  final int pavimentos;
  final int volume;

  @override
  _ProjectEditedState createState() => _ProjectEditedState();
}

GlobalKey<FormState> _key = new GlobalKey();
String titulo, img, obs;
int volume, pavimento;
TextEditingController _titulo = TextEditingController();
TextEditingController _img = TextEditingController();
TextEditingController _obs = TextEditingController();
TextEditingController _volume = TextEditingController();
TextEditingController _pavimento = TextEditingController();

class _ProjectEditedState extends State<ProjectEdited> {
  Widget build(BuildContext context) {
    _titulo.text = widget.titulo;
    _obs.text = widget.obs;
    _volume.text = widget.volume.toString();
    _pavimento.text = widget.pavimentos.toString();
    _img.text = widget.img;
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Projeto"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: _titulo,
                  decoration: InputDecoration(hintText: 'Título'),
                  maxLength: 255,
                  onSaved: (String val) {
                    titulo = val;
                  },
                ),
                TextFormField(
                  controller: _pavimento,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Número de Pavimentos'),
                  maxLength: 10,
                ),
                TextFormField(
                  controller: _obs,
                  decoration: InputDecoration(hintText: 'Observações'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _volume,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Volume'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _img,
                  decoration: InputDecoration(hintText: 'Imagem(link)'),
                  maxLength: 255,
                ),
                SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      // Sem erros na validação

                      img = _img.text;
                      titulo = _titulo.text;
                      obs = _obs.text;
                      pavimento = int.parse(_pavimento.text);
                      volume = int.parse(_volume.text);

                      _key.currentState.save();
                      putProject(
                          widget.id, titulo, pavimento, img, obs, volume);
                      var snackBar = SnackBar(
                          content: Text('Projeto atualizado com sucesso'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ProjectsScreen(),
                        ),
                      );
                    }
                  },
                  child: Text('Salvar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//                    volume = int.parse(val);