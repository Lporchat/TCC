import 'package:flutter/material.dart';

class ProjectFormScreen extends StatefulWidget {
  @override
  _ProjectFormScreenState createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  String titulo, num_pavimentos, obs;

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Título $titulo");
      print("Número de Pavimentos $num_pavimentos");
      print("Observações $obs");
    } else {
      // // erro de validação
      // setState(() {
      //   _validate = true;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nome do Projeto"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Título'),
                  maxLength: 255,
                  onSaved: (String val) {
                    titulo = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Número de Pavimentos'),
                  maxLength: 10,
                  onSaved: (String val) {
                    num_pavimentos = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Observações'),
                  maxLength: 255,
                  onSaved: (String val) {
                    obs = val;
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
