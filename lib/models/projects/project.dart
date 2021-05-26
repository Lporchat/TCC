import 'package:dashboard/models/projects/project_model.dart';
import 'package:dio/dio.dart';

Future getAllprojects() async {
  var r = await Dio().get("https://lit-caverns-97293.herokuapp.com/projetos/");
  List<ProjectModel> lista = [];

  for (var json in (r.data) as List) {
    ProjectModel model = ProjectModel(
        titulo: json['Titulo'],
        id: json['_id'],
        img: json['Img'],
        volume: json['VolumeT'],
        pavimentos: json['NumPavimentos'],
        obs: json['Obs']);
    lista.add(model);
  }
  return lista;
}

Future getProject(String titulo) async {
  var r = await Dio()
      .get("https://lit-caverns-97293.herokuapp.com/projetos/" + titulo);
  List<ProjectModel> lista = [];

  for (var json in (r.data) as List) {
    ProjectModel model = ProjectModel(
        titulo: json['Titulo'],
        id: json['_id'],
        img: json['Img'],
        volume: json['VolumeT'],
        pavimentos: json['NumPavimentos']);
    lista.add(model);
  }
  return lista;
}

Future postProject(String titulo, int pavimentos,
    [String Img = "", String obs = "", int volume = 0]) async {
  var r = await Dio()
      .post('https://lit-caverns-97293.herokuapp.com/projetos', data: {
    "Titulo": titulo,
    "Img": Img,
    "NumPavimentos": pavimentos,
    "Obs": obs,
    "VolumeT": volume,
  });
  print(r.data);
  return r.data;
}

Future putProject(String id, String titulo, int pavimentos,
    [String Img, String obs, int volume]) async {
  var r = await Dio()
      .put('https://lit-caverns-97293.herokuapp.com/projetos/' + id, data: {
    "Titulo": titulo,
    "Img": Img,
    "NumPavimentos": pavimentos,
    "Obs": obs,
    "VolumeT": volume,
  });
  print(r.data);
  return r.data;
}

Future deleteProject(String id) async {
  var r = await Dio()
      .delete('https://lit-caverns-97293.herokuapp.com/projetos/' + id);
  print(r.data);
  return r.data;
}
