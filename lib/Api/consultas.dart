import 'dart:convert';
import 'package:camba/Api/Models/categories.dart';
import 'package:http/http.dart' as http;

class Consultas {
  dynamic responde;
  final url = Uri.parse(
      'https://cambachivache.net:9000/api/categorias/obtener_categorias');

  Future<Categories> getCategories() async {
    final res = await http.post(url);
    this.responde = json.decode(res.body);
    var categories = Categories.fromJson(responde);
    // print(categories);
    return categories;
  }
}
