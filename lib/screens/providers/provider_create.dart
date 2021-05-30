import 'package:dashboard/models/Providers/providers.dart';
import 'package:dashboard/screens/providers/providers_screem.dart';
import 'package:flutter/material.dart';

class ProviderCreate extends StatefulWidget {
  @override
  _ProviderCreateState createState() => _ProviderCreateState();
}

TextEditingController _nome = TextEditingController();
TextEditingController _cnpj = TextEditingController();

class _ProviderCreateState extends State<ProviderCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Projeto"),
        centerTitle: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _nome,
                  decoration: InputDecoration(hintText: 'Nome'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _cnpj,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'CNPJ'),
                  maxLength: 20,
                ),
                SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    // Sem erros na validação

                    String nome = _nome.text;
                    int cnpj = int.parse(_cnpj.text);
                    _nome.text = "";
                    _cnpj.text = "";
                    postProvider(nome, cnpj);
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
