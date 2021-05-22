import 'dart:convert';
import 'package:camba/Api/Models/cambasBuscados.dart';
import 'package:camba/Api/Models/categories.dart';
import 'package:http/http.dart' as http;

import 'Models/obtenerCambas.dart';

class Consultas {
  dynamic responde;
  final obtenerCategorias = Uri.parse(
      'https://cambachivache.net:9000/api/categorias/obtener_categorias');

  Future<Categories> getCategories() async {
    final res = await http.post(obtenerCategorias);
    this.responde = json.decode(res.body);
    var categories = Categories.fromJson(responde);
    return categories;
  }

  Future<CambasModel> getCambas(int page) async {
    final obtenerCambas =
        Uri.parse('https://cambachivache.net:9000/api/cambas/obtener_cambas');
    final res = await http.post(obtenerCambas,
        body: {"categoria_nombre": "Todos", "admin": "0", "last": "$page"});
    this.responde = json.decode(res.body);
    CambasModel cambasModel = CambasModel.fromJson(responde);
    return cambasModel;
  }

  // Future<CambasBuscados> getSearchCambas() async {
  //   final obtenerCambasBuscados =
  //       Uri.parse('https://cambachivache.net:9000/api/cambas/buscar-cambas');
  //   final res = await http.post(obtenerCambasBuscados,
  //       body: {"categoria_nombre": "Todos", "admin": "0", "last": "0"});
  //   this.responde = json.decode(res.body);
  //   CambasBuscados cambasBuscados = CambasBuscados.fromJson(responde);
  //   return cambasBuscados;
  // }
}
