import 'package:flutter/material.dart';

class FloorsEdited extends StatefulWidget {
  const FloorsEdited({
    Key key,
    this.id,
    this.idprojeto,
    this.pavimento,
    this.descricao,
    this.volume,
    this.img,
    this.fornecedor,
    this.elemento,
    this.tecnico,
    this.nota,
    this.lacre,
    this.fck,
    this.slump,
    this.volumeaplicado,
    this.datasainda,
    this.datachegada,
    this.datainicio,
    this.datafim,
    this.amostra1_7,
    this.amostra1_28,
    this.amostra1_63,
    this.amostra2_7,
    this.amostra2_28,
    this.amostra2_63,
    this.refencial_7,
    this.refencial_28,
    this.refencial_63,
  }) : super(key: key);

  final String id;
  final String idprojeto;
  final String descricao;
  final String img;
  final String fornecedor;
  final String elemento;
  final String tecnico;
  final String nota;
  final String lacre;
  final String fck;
  final String slump;
  final String volumeaplicado;
  final String datasainda;
  final String datachegada;
  final String datainicio;
  final String datafim;
  final String amostra1_7;
  final String amostra1_28;
  final String amostra1_63;
  final String amostra2_7;
  final String amostra2_28;
  final String amostra2_63;
  final String refencial_7;
  final String refencial_28;
  final String refencial_63;
  final int pavimento;
  final int volume;

  @override
  _FloorsEditedState createState() => _FloorsEditedState();
}

GlobalKey<FormState> _key = new GlobalKey();
TextEditingController _idprojeto = TextEditingController();
TextEditingController _descricao = TextEditingController();
TextEditingController _img = TextEditingController();
TextEditingController _fornecedor = TextEditingController();
TextEditingController _elemento = TextEditingController();
TextEditingController _tecnico = TextEditingController();
TextEditingController _nota = TextEditingController();
TextEditingController _lacre = TextEditingController();
TextEditingController _fck = TextEditingController();
TextEditingController _slump = TextEditingController();
TextEditingController _volumeaplicado = TextEditingController();
TextEditingController _datasainda = TextEditingController();
TextEditingController _datachegada = TextEditingController();
TextEditingController _datainicio = TextEditingController();
TextEditingController _amostra1_7 = TextEditingController();
TextEditingController _amostra1_28 = TextEditingController();
TextEditingController _amostra1_63 = TextEditingController();
TextEditingController _amostra2_7 = TextEditingController();
TextEditingController _amostra2_28 = TextEditingController();
TextEditingController _amostra2_63 = TextEditingController();
TextEditingController _referemcia_7 = TextEditingController();
TextEditingController _referencia_28 = TextEditingController();
TextEditingController _referencia_63 = TextEditingController();
TextEditingController _volume = TextEditingController();
TextEditingController _pavimento = TextEditingController();

class _FloorsEditedState extends State<FloorsEdited> {
  Widget build(BuildContext context) {
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
                  decoration: InputDecoration(hintText: 'Título'),
                  maxLength: 255,
                  onSaved: (String val) {},
                ),
                TextFormField(
                  controller: _pavimento,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Número de Pavimentos'),
                  maxLength: 10,
                ),
                TextFormField(
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
                    // Sem erros na validação
                    var snackBar = SnackBar(
                        content: Text('Projeto atualizado com sucesso'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
