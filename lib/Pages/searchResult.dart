import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final SearchText? searchText;

  const SearchResult({
    this.searchText,
  });

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

  Widget _body() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 25, left: 20),
          child: Text(
            'Resultados para : ${searchText!.text}',
            style: TextStyle(fontSize: 23),
          ),
        ),
      ],
    );
  }
}
