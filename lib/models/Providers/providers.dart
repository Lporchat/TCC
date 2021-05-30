import 'package:dashboard/models/Providers/providers_model.dart';
import 'package:dio/dio.dart';

Future getAllProviders() async {
  var r =
      await Dio().get("https://lit-caverns-97293.herokuapp.com/fornecedores");
  List<ProviderModel> lista = [];

  for (var json in (r.data) as List) {
    ProviderModel model =
        ProviderModel(id: json['_id'], cnpj: json['Cnpj'], nome: json['Nome']);
    lista.add(model);
  }
  return lista;
}

Future postProvider(String nome, int cnpj) async {
  var r = await Dio()
      .post('https://lit-caverns-97293.herokuapp.com/fornecedores', data: {
    "Cnpj": cnpj,
    "Nome": nome,
  });
  return r.data;
}

Future putProvider(String id, String nome, int cnpj) async {
  var r = await Dio()
      .put('https://lit-caverns-97293.herokuapp.com/fornecedores/' + id, data: {
    "Cnpj": cnpj,
    "Nome": nome,
  });
  return r.data;
}

Future deleteProvider(String id) async {
  var r = await Dio()
      .delete('https://lit-caverns-97293.herokuapp.com/fornecedores/$id');
  print(id);
  print(r.data);
  return r.data;
}
