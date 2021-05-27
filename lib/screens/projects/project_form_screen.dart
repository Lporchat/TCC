import 'package:dashboard/models/Providers/project.dart';
import 'package:flutter/material.dart';

class ProjectFormScreen extends StatefulWidget {
  @override
  _ProjectFormScreenState createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  String titulo, img, obs;
  int volume, pavimento;
  TextEditingController _titulo = TextEditingController();
  TextEditingController _img = TextEditingController();
  TextEditingController _obs = TextEditingController();
  TextEditingController _volume = TextEditingController();
  TextEditingController _pavimento = TextEditingController();

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      postProject(titulo, pavimento, img, obs, volume);
      _titulo.text = "";
      _obs.text = "";
      _volume.text = "";
      _pavimento.text = "";
      _img.text = "";
      var snackBar = SnackBar(content: Text('Projeto criado com sucesso'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Projeto"),
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
                  onSaved: (String val) {
                    pavimento = int.parse(val);
                    ;
                  },
                ),
                TextFormField(
                  controller: _obs,
                  decoration: InputDecoration(hintText: 'Observações'),
                  maxLength: 255,
                  onSaved: (String val) {
                    obs = val;
                  },
                ),
                TextFormField(
                  controller: _volume,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Volume'),
                  maxLength: 255,
                  onSaved: (String val) {
                    volume = int.parse(val);
                    ;
                  },
                ),
                TextFormField(
                  controller: _img,
                  decoration: InputDecoration(hintText: 'Imagem(link)'),
                  maxLength: 255,
                  onSaved: (String val) {
                    img = val;
                  },
                ),
                SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: _sendForm,
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
