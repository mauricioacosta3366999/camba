// To parse this JSON data, do
//
//     final cambasModel = cambasModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

CambasModel cambasModelFromJson(String str) =>
    CambasModel.fromJson(json.decode(str));

class CambasModel {
  CambasModel({
    this.code,
    this.message,
  });

  int? code;
  Message? message;

  factory CambasModel.fromJson(Map<String, dynamic> json) => CambasModel(
        code: json["code"] == null ? null : json["code"],
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
      );
}

class Message {
  Message({
    this.first,
    this.last,
    this.cambas,
  });

  int? first;
  int? last;
  Cambas? cambas;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
        cambas: json["cambas"] == null ? null : Cambas.fromJson(json["cambas"]),
      );
}

class Cambas {
  Cambas({
    this.headers,
    this.original,
    this.exception,
  });

  Headers? headers;
  List<Original>? original;
  dynamic? exception;

  factory Cambas.fromJson(Map<String, dynamic> json) => Cambas(
        headers:
            json["headers"] == null ? null : Headers.fromJson(json["headers"]),
        original: json["original"] == null
            ? null
            : List<Original>.from(
                json["original"].map((x) => Original.fromJson(x))),
        exception: json["exception"],
      );
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers();

  Map<String, dynamic> toJson() => {};
}

class Original {
  Original({
    this.id,
    this.tituloCamba,
    this.descripcion,
    this.precioEstimado,
    this.usuarioId,
    this.estado,
    this.tipo,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.estadoPropuesta,
    this.categorias,
    this.imagenes,
    this.usuario,
  });

  int? id;
  String? tituloCamba;
  String? descripcion;
  String? precioEstimado;
  int? usuarioId;
  String? estado;
  String? tipo;
  dynamic? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? estadoPropuesta;
  List<Categoria>? categorias;
  List<Imagene>? imagenes;
  Usuario? usuario;

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        id: json["id"] == null ? null : json["id"],
        tituloCamba: json["titulo_camba"] == null ? null : json["titulo_camba"],
        descripcion: json["descripcion"] == null ? null : json["descripcion"],
        precioEstimado:
            json["precio_estimado"] == null ? null : json["precio_estimado"],
        usuarioId: json["usuario_id"] == null ? null : json["usuario_id"],
        estado: json["estado"] == null ? null : json["estado"],
        tipo: json["tipo"] == null ? null : json["tipo"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        estadoPropuesta:
            json["estado_propuesta"] == null ? null : json["estado_propuesta"],
        categorias: json["categorias"] == null
            ? null
            : List<Categoria>.from(
                json["categorias"].map((x) => Categoria.fromJson(x))),
        imagenes: json["imagenes"] == null
            ? null
            : List<Imagene>.from(
                json["imagenes"].map((x) => Imagene.fromJson(x))),
        usuario:
            json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
      );
}

class Categoria {
  Categoria({
    this.id,
    this.nombreCategoria,
    this.pathImg,
    this.estadoCategoria,
    this.padreId,
    this.principal,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? nombreCategoria;
  String? pathImg;
  EstadoCategoria? estadoCategoria;
  int? padreId;
  Principal? principal;
  dynamic? createdAt;
  dynamic? updatedAt;
  Pivot? pivot;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"] == null ? null : json["id"],
        nombreCategoria:
            json["nombre_categoria"] == null ? null : json["nombre_categoria"],
        pathImg: json["path_img"] == null ? null : json["path_img"],
        estadoCategoria: json["estado_categoria"] == null
            ? null
            : estadoCategoriaValues.map[json["estado_categoria"]],
        padreId: json["padre_id"] == null ? null : json["padre_id"],
        principal: json["principal"] == null
            ? null
            : principalValues.map[json["principal"]],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );
}

enum EstadoCategoria { ACTIVO }

final estadoCategoriaValues = EnumValues({"Activo": EstadoCategoria.ACTIVO});

class Pivot {
  Pivot({
    this.cambaPropuestaId,
    this.categoriaId,
  });

  int? cambaPropuestaId;
  int? categoriaId;

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

enum Principal { SI, NO }

final principalValues = EnumValues({"No": Principal.NO, "Si": Principal.SI});

class Imagene {
  Imagene({
    this.id,
    this.cambaPropuestaId,
    this.pathImagen1920,
    this.createdAt,
    this.updatedAt,
    this.pathImagen1280,
    this.pathImagen640,
  });

  int? id;
  int? cambaPropuestaId;
  String? pathImagen1920;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? pathImagen1280;
  String? pathImagen640;

  factory Imagene.fromJson(Map<String, dynamic> json) => Imagene(
        id: json["id"] == null ? null : json["id"],
        cambaPropuestaId: json["camba_propuesta_id"] == null
            ? null
            : json["camba_propuesta_id"],
        pathImagen1920:
            json["path_imagen_1920"] == null ? null : json["path_imagen_1920"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pathImagen1280:
            json["path_imagen_1280"] == null ? null : json["path_imagen_1280"],
        pathImagen640:
            json["path_imagen_640"] == null ? null : json["path_imagen_640"],
      );
}

class Usuario {
  Usuario({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.emailVerifiedAt,
    this.activo,
    this.tokenValidacion,
    this.admin,
    this.telefono,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? userName;
  String? email;
  DateTime? emailVerifiedAt;
  String? activo;
  String? tokenValidacion;
  String? admin;
  String? telefono;
  String? imagePath;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        userName: json["user_name"] == null ? null : json["user_name"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        activo: json["activo"] == null ? null : json["activo"],
        tokenValidacion:
            json["token_validacion"] == null ? null : json["token_validacion"],
        admin: json["admin"] == null ? null : json["admin"],
        telefono: json["telefono"] == null ? null : json["telefono"],
        imagePath: json["image_path"] == null ? null : json["image_path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class EnumValues<T> {
  @required
  Map<String, T> map;
  @required
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
