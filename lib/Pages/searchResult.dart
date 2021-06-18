import 'package:camba/Api/consultas.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  String searchText;
  SearchResult(this.searchText, {Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Header(),
          _body(),
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    _inicializate();
  }

  void _inicializate() async {
    var searchText = widget.searchText;
    final result = await Consultas().searchCamba(searchText);
    print('esto es searchResultssss $result');
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 25, left: 20),
          child: Text(
            'Resultados para : ${widget.searchText}',
            style: TextStyle(fontSize: 23),
          ),
        ),
      ],
    );
  }
}
