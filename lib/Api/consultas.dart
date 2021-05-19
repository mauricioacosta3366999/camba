import 'dart:convert';
import 'package:camba/Api/Models/categories.dart';
import 'package:http/http.dart' as http;

import 'Models/obtenerCambas.dart';

class Consultas {
  dynamic responde;
  final url = Uri.parse(
      'https://cambachivache.net:9000/api/categorias/obtener_categorias');

  Future<Categories> getCategories() async {
    final res = await http.post(url);
    this.responde = json.decode(res.body);
    var categories = Categories.fromJson(responde);
    return categories;
  }

  Future<CambasModel> getCambas() async {
    final url2 =
        Uri.parse('https://cambachivache.net:9000/api/cambas/obtener_cambas');
    final res = await http.post(url2,
        body: {"categoria_nombre": "Todos", "admin": "0", "last": "0"});
    this.responde = json.decode(res.body);
    CambasModel cambasModel = CambasModel.fromJson(responde);
    return cambasModel;
  }

  Future<CambasModel> getSearchCambas() async {
    final url2 =
        Uri.parse('https://cambachivache.net:9000/api/cambas/obtener_cambas');
    final res = await http.post(url2,
        body: {"categoria_nombre": "Todos", "admin": "0", "last": "0"});
    this.responde = json.decode(res.body);
    CambasModel cambasModel = CambasModel.fromJson(responde);
    return cambasModel;
  }
}
