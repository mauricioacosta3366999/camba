import 'package:camba/Api/consultas.dart';
import 'package:flutter/material.dart';
import 'package:camba/Api/Models/categories.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late Categories categories;

  void initState() {
    super.initState();
    _inicializate();
  }

  void _inicializate() async {
    categories = await Consultas().getCategories();
    print(categories.productos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Categorías'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('TODAS LAS CATEGORIAS',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Icon(Icons.chevron_right_outlined)
              ],
            ),
            ExpansionTile(
              title: Text(
                "PRODUCTOS",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Sub title',
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text('data'),
                    ),
                    ListTile(
                      title: Text('data'),
                    ),
                    ListTile(
                      title: Text('data'),
                    )
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "SERVICIOS",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Sub title',
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text('data'),
                    )
                  ],
                ),
                // ListTile(
                //   title: Text('data'),
                // )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('OTROS',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Icon(Icons.chevron_right_outlined)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
