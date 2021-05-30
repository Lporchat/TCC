import 'package:dashboard/models/Providers/providers.dart';
import 'package:dashboard/screens/providers/provider_create.dart';
import 'package:dashboard/screens/providers/providers_screem.dart';
import 'package:flutter/material.dart';

class ProviderEdited extends StatefulWidget {
  const ProviderEdited({Key key, this.id, this.nome, this.cnpj})
      : super(key: key);

  final String id;
  final String nome;
  final int cnpj;

  @override
  _ProviderEditedState createState() => _ProviderEditedState();
}

TextEditingController _nome = TextEditingController();
TextEditingController _cnpj = TextEditingController();

class _ProviderEditedState extends State<ProviderEdited> {
  @override
  Widget build(BuildContext context) {
    _nome.text = widget.nome;
    _cnpj.text = widget.cnpj.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Projeto"),
        centerTitle: true,
        actions: [

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _nome,
                  decoration: InputDecoration(hintText: 'Título'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _cnpj,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Número de Pavimentos'),
                  maxLength: 20,
                ),
                SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    // Sem erros na validação
                    String id = widget.id;
                    String nome = _nome.text;
                    int cnpj = int.parse(_cnpj.text);

                    putProvider(id, nome, cnpj);
                    var snackBar = SnackBar(
                        content: Text('Projeto atualizado com sucesso'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProvidersScreem(),
                      ),
                    );
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
