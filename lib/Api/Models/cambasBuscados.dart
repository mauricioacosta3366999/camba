// To parse this JSON data, do
//
//     final cambasBuscados = cambasBuscadosFromJson(jsonString);

import 'dart:convert';

Map<String, CambasBuscados> cambasBuscadosFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, CambasBuscados>(k, CambasBuscados.fromJson(v)));

String cambasBuscadosToJson(Map<String, CambasBuscados> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class CambasBuscados {
  CambasBuscados({
    required this.id,
    required this.tituloCamba,
    required this.descripcion,
    required this.precioEstimado,
    required this.usuarioId,
    required this.estado,
    required this.tipo,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.estadoPropuesta,
    required this.categorias,
    required this.imagenes,
    required this.usuario,
  });

  int id;
  String tituloCamba;
  String descripcion;
  String precioEstimado;
  int usuarioId;
  String estado;
  String tipo;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String estadoPropuesta;
  List<Categoria> categorias;
  List<Imagene> imagenes;
  Usuario usuario;

  factory CambasBuscados.fromJson(Map<String, dynamic> json) => CambasBuscados(
        id: json["id"] == null ? null : json["id"],
        tituloCamba: json["titulo_camba"] == null ? null : json["titulo_camba"],
        descripcion: json["descripcion"] == null ? null : json["descripcion"],
        precioEstimado:
            json["precio_estimado"] == null ? null : json["precio_estimado"],
        usuarioId: json["usuario_id"] == null ? null : json["usuario_id"],
        estado: json["estado"] == null ? null : json["estado"],
        tipo: json["tipo"] == null ? null : json["tipo"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        estadoPropuesta:
            json["estado_propuesta"] == null ? null : json["estado_propuesta"],
        categorias: json["categorias"],
        imagenes: json["imagenes"],
        usuario: json["usuario"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "titulo_camba": tituloCamba == null ? null : tituloCamba,
        "descripcion": descripcion == null ? null : descripcion,
        "precio_estimado": precioEstimado == null ? null : precioEstimado,
        "usuario_id": usuarioId == null ? null : usuarioId,
        "estado": estado == null ? null : estado,
        "tipo": tipo == null ? null : tipo,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "estado_propuesta": estadoPropuesta == null ? null : estadoPropuesta,
        "categorias": categorias == null
            ? null
            : List<dynamic>.from(categorias.map((x) => x.toJson())),
        "imagenes": imagenes == null
            ? null
            : List<dynamic>.from(imagenes.map((x) => x.toJson())),
        "usuario": usuario == null ? null : usuario.toJson(),
      };
}

class Categoria {
  Categoria({
    required this.id,
    required this.nombreCategoria,
    required this.pathImg,
    required this.estadoCategoria,
    required this.padreId,
    required this.principal,
    this.createdAt,
    this.updatedAt,
    required this.pivot,
  });

  int id;
  String nombreCategoria;
  String pathImg;
  String estadoCategoria;
  int padreId;
  String principal;
  dynamic createdAt;
  dynamic updatedAt;
  Pivot pivot;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"] == null ? null : json["id"],
        nombreCategoria:
            json["nombre_categoria"] == null ? null : json["nombre_categoria"],
        pathImg: json["path_img"] == null ? null : json["path_img"],
        estadoCategoria:
            json["estado_categoria"] == null ? null : json["estado_categoria"],
        padreId: json["padre_id"] == null ? null : json["padre_id"],
        principal: json["principal"] == null ? null : json["principal"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pivot: json["pivot"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre_categoria": nombreCategoria == null ? null : nombreCategoria,
        "path_img": pathImg == null ? null : pathImg,
        "estado_categoria": estadoCategoria == null ? null : estadoCategoria,
        "padre_id": padreId == null ? null : padreId,
        "principal": principal == null ? null : principal,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pivot": pivot == null ? null : pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    required this.cambaPropuestaId,
    required this.categoriaId,
  });

  int cambaPropuestaId;
  int categoriaId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        cambaPropuestaId: json["camba_propuesta_id"] == null
            ? null
            : json["camba_propuesta_id"],
        categoriaId: json["categoria_id"] == null ? null : json["categoria_id"],
      );

  Map<String, dynamic> toJson() => {
        "camba_propuesta_id":
            cambaPropuestaId == null ? null : cambaPropuestaId,
        "categoria_id": categoriaId == null ? null : categoriaId,
      };
}

class Imagene {
  Imagene({
    required this.id,
    required this.cambaPropuestaId,
    required this.pathImagen1920,
    required this.createdAt,
    required this.updatedAt,
    required this.pathImagen1280,
    required this.pathImagen640,
  });

  int id;
  int cambaPropuestaId;
  String pathImagen1920;
  DateTime createdAt;
  DateTime updatedAt;
  String pathImagen1280;
  String pathImagen640;

  factory Imagene.fromJson(Map<String, dynamic> json) => Imagene(
        id: json["id"] == null ? null : json["id"],
        cambaPropuestaId: json["camba_propuesta_id"] == null
            ? null
            : json["camba_propuesta_id"],
        pathImagen1920:
            json["path_imagen_1920"] == null ? null : json["path_imagen_1920"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pathImagen1280:
            json["path_imagen_1280"] == null ? null : json["path_imagen_1280"],
        pathImagen640:
            json["path_imagen_640"] == null ? null : json["path_imagen_640"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "camba_propuesta_id":
            cambaPropuestaId == null ? null : cambaPropuestaId,
        "path_imagen_1920": pathImagen1920 == null ? null : pathImagen1920,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "path_imagen_1280": pathImagen1280 == null ? null : pathImagen1280,
        "path_imagen_640": pathImagen640 == null ? null : pathImagen640,
      };
}

class Usuario {
  Usuario({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.emailVerifiedAt,
    required this.activo,
    required this.tokenValidacion,
    required this.admin,
    required this.telefono,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String userName;
  String email;
  DateTime emailVerifiedAt;
  String activo;
  String tokenValidacion;
  String admin;
  String telefono;
  String imagePath;
  DateTime createdAt;
  DateTime updatedAt;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        userName: json["user_name"] == null ? null : json["user_name"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        activo: json["activo"] == null ? null : json["activo"],
        tokenValidacion:
            json["token_validacion"] == null ? null : json["token_validacion"],
        admin: json["admin"] == null ? null : json["admin"],
        telefono: json["telefono"] == null ? null : json["telefono"],
        imagePath: json["image_path"] == null ? null : json["image_path"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "user_name": userName == null ? null : userName,
        "email": email == null ? null : email,
        "email_verified_at":
            emailVerifiedAt == null ? null : emailVerifiedAt.toIso8601String(),
        "activo": activo == null ? null : activo,
        "token_validacion": tokenValidacion == null ? null : tokenValidacion,
        "admin": admin == null ? null : admin,
        "telefono": telefono == null ? null : telefono,
        "image_path": imagePath == null ? null : imagePath,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
