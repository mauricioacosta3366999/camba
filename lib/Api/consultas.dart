import 'dart:convert';
import 'package:camba/Api/Models/cambasBuscados.dart';
import 'package:camba/Api/Models/categories.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/obtenerCambas.dart';
import 'Models/loginModel.dart';

class Consultas {
  dynamic responde;
  final api = 'https://cambachivache.net:9000/api';

  Future<Categories> getCategories() async {
    final obtenerCategorias = Uri.parse('$api/categorias/obtener_categorias');

    final res = await http.post(obtenerCategorias);
    this.responde = json.decode(res.body);
    var categories = Categories.fromJson(responde);
    return categories;
  }

  Future<CambasModel> getCambas(int page, String categoryFilter) async {
    final obtenerCambas = Uri.parse('$api/cambas/obtener_cambas');

    final res = await http.post(obtenerCambas, body: {
      "categoria_nombre": categoryFilter,
      "admin": "0",
      "last": "$page"
    });
    this.responde = json.decode(res.body);
    CambasModel cambasModel = CambasModel.fromJson(responde);
    return cambasModel;
  }

  Future login(String email, String pass) async {
    final loginURL = Uri.parse('$api/user/login');

    final res =
        await http.post(loginURL, body: {"email": email, "password": pass});
    this.responde = json.decode(res.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = responde['user_id'];
    prefs.setInt('userId', userId == null ? 0 : userId);
    print(userId);
    return responde;
  }

  Future logout(String email, String pass) async {
    final loginURL = Uri.parse('$api/user/login');

    final res =
        await http.post(loginURL, body: {"email": email, "password": pass});
    this.responde = json.decode(res.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = responde['user_id'];
    prefs.setInt('userId', userId == null ? 0 : userId);
    print(userId);
    return responde;
  }

  Future register(String nombre, String email, String telefono, String userName,
      String pass, String imagen) async {
    final registerURL = Uri.parse('$api/user/create-user');

    final res = await http.post(registerURL, body: {
      "nombre": nombre,
      "email": email,
      "telefono": telefono,
      "user_name": userName,
      "password": pass,
      "imagen": imagen,
    });
    this.responde = json.decode(res.body);
    return responde;
  }

  Future searchCamba(searchText) async {
    final registerURL = Uri.parse('$api/cambas/buscar-cambas');

    final res = await http.post(registerURL, body: {"criterio": searchText});
    this.responde = json.decode(res.body);
    return responde;
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

  Future cambaCreate(titleCamba, descriptionCamba, priceCamba, categoriesId,
      tipoCamba, idCamba) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('userId');

    final createUrl = Uri.parse('$api/cambas/crear');

    final res = await http.post(createUrl, body: {
      "titulo_camba": titleCamba,
      "descripcion": descriptionCamba,
      "precio_estimado": 20000,
      "categoria_ids": "1,2",
      "user_id": 524,
      "tipo": 1,
      "camba_id": 0
    });
    this.responde = json.decode(res.body);
    print('esto es la consulta al crear camba');
    print(responde);
    return responde;
  }
}
