import 'package:dashboard/models/floors/floors_model.dart';
import 'package:dio/dio.dart';

Future getfloors(String titulo) async {
  var r = await Dio()
      .get("https://lit-caverns-97293.herokuapp.com/pavimentos/" + titulo);
  List<FloorsModel> lista = [];

  for (var json in (r.data) as List) {
    FloorsModel model = FloorsModel(
      id: json['_id'],
      idprojeto: json['IdProjeto'],
      pavimento: json['Pavimento'],
      descricao: json['Descricao'],
      volume: json['Volume'],
      img: json['Img'],
      fornecedor: json['Fornecedor'],
      elementoestrutural: json['ElementoEstrutural'],
      tecnico: json['Tecnico'],
      nota: json['Nota'],
      lacre: json['Lacre'],
      fck: json['Fck'],
      slump: json['Slump'],
      volumeaplicado: json['VolumeAplicado'],
      datasaidausina: json['DataSaidaUsina'],
      datachegadaobra: json['DataChegadaObra'],
      datainicio: json['DataInicio'],
      datafim: json['DataFim'],
      amostra1_7: json['Amostra1_7'],
      amostra1_28: json['Amostra1_28'],
      amostra1_63: json['Amostra1_63'],
      amostra2_7: json['Amostra2_7'],
      amostra2_28: json['Amostra2_28'],
      amostra2_63: json['Amostra2_63'],
      referencia_7: json['Referencia_7'],
      referencia_28: json['Referencia_28'],
      referencia_63: json['Referencia_63'],
    );
    lista.add(model);
  }
  return lista;
}

Future postFloors(
  String id,
  String idprojeto,
  int pavimento,
  String fornecedor,
  String tecnico, [
  String descricao = '',
  String volume = '',
  String img = '',
  String elemento = '',
  String nota = '',
  String lacre = '',
  String fck = '',
  String slump = '',
  int volumeaplicado = 0,
  String datasaida = '00/00/0000',
  String datachegada = '00/00/0000',
  String datainicio = '00/00/0000',
  String datafim = '00/00/0000',
  String amostra1_7 = '',
  String amostra1_28 = '',
  String amostra1_63 = '',
  String amostra2_7 = '',
  String amostra2_28 = '',
  String amostra2_63 = '',
  String referencia_7 = '',
  String referencia_28 = '',
  String referencia_63 = '',
]) async {
  var r = await Dio()
      .post('https://lit-caverns-97293.herokuapp.com/pavimentos/' + id, data: {
    "IdProjeto": idprojeto,
    "Pavimento": pavimento,
    "Descricao": descricao,
    "Img": img,
    "Fornecedor": fornecedor,
    "ElementoEstrutural": elemento,
    "Tecnico": tecnico,
    "Nota": nota,
    "Lacre": lacre,
    "Fck": fck,
    "Slump": slump,
    "VolumeAplicado": volumeaplicado,
    "DataSaidaUsina": datasaida,
    "DataChegadaObra": datachegada,
    "DataInicio": datainicio,
    "DataFim": datafim,
    "Amostra1_7": amostra1_7,
    "Amostra1_28": amostra1_28,
    "Amostra1_63": amostra1_63,
    "Amostra2_7": amostra2_7,
    "Amostra2_28": amostra2_28,
    "Amostra2_63": amostra2_63,
    "Referencia_7": referencia_7,
    "Referencia_28": referencia_28,
    "Referencia_63": referencia_28,
  });
  print(r.data);
  return r.data;
}

Future putFloors(
  String id,
  String idprojeto,
  int pavimento,
  String fornecedor,
  String tecnico, [
  String descricao = '',
  String volume = '',
  String img = '',
  String elemento = '',
  String nota = '',
  String lacre = '',
  String fck = '',
  String slump = '',
  int volumeaplicado = 0,
  String datasaida = '00/00/0000',
  String datachegada = '00/00/0000',
  String datainicio = '00/00/0000',
  String datafim = '00/00/0000',
  String amostra1_7 = '',
  String amostra1_28 = '',
  String amostra1_63 = '',
  String amostra2_7 = '',
  String amostra2_28 = '',
  String amostra2_63 = '',
  String referencia_7 = '',
  String referencia_28 = '',
  String referencia_63 = '',
]) async {
  var r = await Dio()
      .put('https://lit-caverns-97293.herokuapp.com/pavimentos/' + id, data: {
    "IdProjeto": idprojeto,
    "Pavimento": pavimento,
    "Descricao": descricao,
    "Img": img,
    "Fornecedor": fornecedor,
    "ElementoEstrutural": elemento,
    "Tecnico": tecnico,
    "Nota": nota,
    "Lacre": lacre,
    "Fck": fck,
    "Slump": slump,
    "VolumeAplicado": volumeaplicado,
    "DataSaidaUsina": datasaida,
    "DataChegadaObra": datachegada,
    "DataInicio": datainicio,
    "DataFim": datafim,
    "Amostra1_7": amostra1_7,
    "Amostra1_28": amostra1_28,
    "Amostra1_63": amostra1_63,
    "Amostra2_7": amostra2_7,
    "Amostra2_28": amostra2_28,
    "Amostra2_63": amostra2_63,
    "Referencia_7": referencia_7,
    "Referencia_28": referencia_28,
    "Referencia_63": referencia_28,
  });
  print(r.data);
  return r.data;
}

Future deleteFloors(String id) async {
  var r = await Dio()
      .delete('https://lit-caverns-97293.herokuapp.com/pavimentos/' + id);
  print(r.data);
  return r.data;
}
