import 'package:dashboard/models/tech/tech_model.dart';
import 'package:dio/dio.dart';

Future getAllTech() async {
  var r = await Dio().get("https://lit-caverns-97293.herokuapp.com/tecnicos/");
  List<TechModel> lista = [];

  for (var json in (r.data) as List) {
    TechModel model =
        TechModel(id: json['_id'], cpf: json['Cpf'], nome: json['Nome']);
    lista.add(model);
  }
  return lista;
}

Future postTech(String nome, int cpf) async {
  var r = await Dio()
      .post('https://lit-caverns-97293.herokuapp.com/tecnicos/', data: {
    "Cpf": cpf,
    "Nome": nome,
  });
  return r.data;
}

Future putTech(String id, String nome, int cpf) async {
  var r = await Dio()
      .put('https://lit-caverns-97293.herokuapp.com/tecnicos/' + id, data: {
    "Cpf": cpf,
    "Nome": nome,
  });
  return r.data;
}

Future deleteTech(String id) async {
  var r = await Dio()
      .delete('https://lit-caverns-97293.herokuapp.com/tecnicos/$id');
  print(id);
  print(r.data);
  return r.data;
}
