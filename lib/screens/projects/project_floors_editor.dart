import 'package:dashboard/screens/projects/project_detail.dart';
import 'package:dashboard/screens/projects/project_edited.dart';
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
  final String volume;
  final int volumeaplicado;
  final int pavimento;

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
TextEditingController _datafim = TextEditingController();
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
    _descricao.text = widget.descricao;
    _img.text = widget.img;
    _fornecedor.text = widget.fornecedor;
    _elemento.text = widget.elemento;
    _tecnico.text = widget.tecnico;
    _nota.text = widget.nota;
    _lacre.text = widget.lacre;
    _fck.text = widget.fck;
    _slump.text = widget.slump;
    _volumeaplicado.text = widget.volumeaplicado.toString();
    _datasainda.text = widget.datasainda;
    _datachegada.text = widget.datachegada;
    _datainicio.text = widget.datainicio;
    _datafim.text = widget.datafim;
    _amostra1_7.text = widget.amostra1_7;
    _amostra1_28.text = widget.amostra1_28;
    _amostra1_63.text = widget.amostra1_63;
    _amostra2_7.text = widget.amostra2_7;
    _amostra2_28.text = widget.amostra2_28;
    _amostra2_63.text = widget.amostra2_63;
    _referemcia_7.text = widget.refencial_7;
    _referencia_28.text = widget.refencial_28;
    _referencia_63.text = widget.refencial_63;
    _volume.text = widget.volume;
    _pavimento.text = widget.pavimento.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Pavimento"),
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
                    controller: _pavimento,
                    decoration: InputDecoration(hintText: 'Pavimento'),
                    maxLength: 255),
                TextFormField(
                  controller: _descricao,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Descrição'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _volume,
                  decoration: InputDecoration(hintText: 'Volume'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _img,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Imagem (Link)'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _tecnico,
                  decoration: InputDecoration(hintText: 'Tecnico'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _fornecedor,
                  decoration: InputDecoration(hintText: 'Formulario'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _elemento,
                  decoration: InputDecoration(hintText: 'Elemento Estrutural'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _nota,
                  decoration: InputDecoration(hintText: 'Nota'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _lacre,
                  decoration: InputDecoration(hintText: 'Lacre'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _fck,
                  decoration: InputDecoration(hintText: 'Fck'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _slump,
                  decoration: InputDecoration(hintText: 'Slump'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _volumeaplicado,
                  decoration: InputDecoration(hintText: 'Volume Aplicado'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _datasainda,
                  decoration: InputDecoration(hintText: 'Data Sainda Usina'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _datachegada,
                  decoration:
                      InputDecoration(hintText: 'Data de Chegada na Obra'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _datainicio,
                  decoration: InputDecoration(hintText: 'data do Inicio'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _datafim,
                  decoration: InputDecoration(hintText: 'Data do Fim'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _amostra1_7,
                  decoration: InputDecoration(hintText: 'Amostra 1 do dia 7'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _amostra1_28,
                  decoration: InputDecoration(hintText: 'Amostra 1 do dia 28'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _amostra1_63,
                  decoration: InputDecoration(hintText: 'Amostra 1 do dia 63'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _amostra2_7,
                  decoration: InputDecoration(hintText: 'Amostra 2 do dia 7'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _amostra2_28,
                  decoration: InputDecoration(hintText: 'Amostra 2 do dia 28'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _amostra2_63,
                  decoration: InputDecoration(hintText: 'Amostra 2 do dia 63'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _referemcia_7,
                  decoration: InputDecoration(hintText: 'Referencia do 7'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _referencia_28,
                  decoration: InputDecoration(hintText: 'Referencia do 28'),
                  maxLength: 255,
                ),
                TextFormField(
                  controller: _referencia_63,
                  decoration: InputDecoration(hintText: 'Referencia do 63'),
                  maxLength: 255,
                ),
                SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    // Sem erros na validação
                    var snackBar = SnackBar(
                        content: Text('Projeto atualizado com sucesso'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProjectDetailScreen(
                          // precisa recer o que o projeto passadp
                          id: widget.idprojeto,
                          img: "",
                          obs: "",
                          pavimentos: 0,
                          titulo: "",
                          volume: 0,
                        ),
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
