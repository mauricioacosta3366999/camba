import 'dart:convert';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    required this.productos,
    required this.servicios,
  });

  Productos productos;
  Map<String, List<dynamic>> servicios;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        productos: Productos.fromJson(json["Productos"]),
        servicios: Map.from(json["Servicios"]).map((k, v) =>
            MapEntry<String, List<dynamic>>(
                k, List<dynamic>.from(v.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "Productos": productos.toJson(),
        "Servicios": Map.from(servicios).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
      };
}

class Productos {
  Productos({
    required this.deportes,
    required this.indumentaria,
    required this.bellezaYSalud,
    required this.bebs,
    required this.automotores,
    required this.juguetes,
    required this.hogar,
    required this.industria,
    required this.arte,
    required this.herramientas,
    required this.videojuegos,
    required this.equipaje,
    required this.educacin,
    required this.bicicletasYTriciclos,
    required this.alimentacin,
    required this.jardinera,
    required this.agriculturaYGanaderia,
    required this.instrumentosMusicales,
  });

  Map<String, String> deportes;
  Map<String, String> indumentaria;
  Map<String, String> bellezaYSalud;
  Map<String, String> bebs;
  Map<String, String> automotores;
  Map<String, String> juguetes;
  Map<String, String> hogar;
  Industria industria;
  Map<String, String> arte;
  List<dynamic> herramientas;
  Videojuegos videojuegos;
  Map<String, String> equipaje;
  Map<String, String> educacin;
  List<dynamic> bicicletasYTriciclos;
  Map<String, String> alimentacin;
  Map<String, String> jardinera;
  Map<String, String> agriculturaYGanaderia;
  List<dynamic> instrumentosMusicales;

  factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        deportes: Map.from(json["Deportes"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        indumentaria: Map.from(json["Indumentaria"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        bellezaYSalud: Map.from(json["Belleza y Salud"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        bebs: Map.from(json["Bebés"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        automotores: Map.from(json["Automotores"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        juguetes: Map.from(json["Juguetes"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        hogar: Map.from(json["Hogar"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        industria: Industria.fromJson(json["Industria"]),
        arte: Map.from(json["Arte"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        herramientas: List<dynamic>.from(json["Herramientas"].map((x) => x)),
        videojuegos: Videojuegos.fromJson(json["Videojuegos"]),
        equipaje: Map.from(json["Equipaje"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        educacin: Map.from(json["Educación"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        bicicletasYTriciclos:
            List<dynamic>.from(json["Bicicletas y Triciclos"].map((x) => x)),
        alimentacin: Map.from(json["Alimentación"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        jardinera: Map.from(json["Jardinería"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        agriculturaYGanaderia: Map.from(json["Agricultura y Ganaderia"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        instrumentosMusicales:
            List<dynamic>.from(json["Instrumentos Musicales"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Deportes":
            Map.from(deportes).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Indumentaria": Map.from(indumentaria)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Belleza y Salud": Map.from(bellezaYSalud)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Bebés": Map.from(bebs).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Automotores": Map.from(automotores)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Juguetes":
            Map.from(juguetes).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Hogar": Map.from(hogar).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Industria": industria.toJson(),
        "Arte": Map.from(arte).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Herramientas": List<dynamic>.from(herramientas.map((x) => x)),
        "Videojuegos": videojuegos.toJson(),
        "Equipaje":
            Map.from(equipaje).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Educación":
            Map.from(educacin).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Bicicletas y Triciclos":
            List<dynamic>.from(bicicletasYTriciclos.map((x) => x)),
        "Alimentación": Map.from(alimentacin)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Jardinería":
            Map.from(jardinera).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Agricultura y Ganaderia": Map.from(agriculturaYGanaderia)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Instrumentos Musicales":
            List<dynamic>.from(instrumentosMusicales.map((x) => x)),
      };
}

class Industria {
  Industria({
    required this.the43,
  });

  String the43;

  factory Industria.fromJson(Map<String, dynamic> json) => Industria(
        the43: json["43"],
      );

  Map<String, dynamic> toJson() => {
        "43": the43,
      };
}

class Videojuegos {
  Videojuegos({
    required this.the53,
  });

  String the53;

  factory Videojuegos.fromJson(Map<String, dynamic> json) => Videojuegos(
        the53: json["53"],
      );

  Map<String, dynamic> toJson() => {
        "53": the53,
      };
}
