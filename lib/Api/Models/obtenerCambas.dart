// import 'dart:convert';

// ObtenerCambas obtenerCambasFromJson(String str) =>
//     ObtenerCambas.fromJson(json.decode(str));

// String obtenerCambasToJson(ObtenerCambas data) => json.encode(data.toJson());

// class ObtenerCambas {
//   ObtenerCambas({
//     required this.code,
//     required this.message,
//   });

//   int code;
//   Message message;

//   factory ObtenerCambas.fromJson(Map<String, dynamic> json) => ObtenerCambas(
//         code: json["code"],
//         message: Message.fromJson(json["message"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message.toJson(),
//       };
// }

// class Message {
//   Message({
//     required this.first,
//     required this.last,
//     required this.cambas,
//   });

//   int first;
//   int last;
//   Cambas cambas;

//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//         first: json["first"],
//         last: json["last"],
//         cambas: Cambas.fromJson(json["cambas"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "first": first,
//         "last": last,
//         "cambas": cambas.toJson(),
//       };
// }

// class Cambas {
//   Cambas({
//     required this.headers,
//     required this.original,
//     this.exception,
//   });

//   Headers headers;
//   List<Original> original;
//   dynamic exception;

//   factory Cambas.fromJson(Map<String, dynamic> json) => Cambas(
//         headers: Headers.fromJson(json["headers"]),
//         original: List<Original>.from(
//             json["original"].map((x) => Original.fromJson(x))),
//         exception: json["exception"],
//       );

//   Map<String, dynamic> toJson() => {
//         "headers": headers.toJson(),
//         "original": List<dynamic>.from(original.map((x) => x.toJson())),
//         "exception": exception,
//       };
// }

// class Headers {
//   Headers();

//   factory Headers.fromJson(Map<String, dynamic> json) => Headers();

//   Map<String, dynamic> toJson() => {};
// }

// class Original {
//   Original({
//     required this.id,
//     required this.tituloCamba,
//     required this.descripcion,
//     required this.precioEstimado,
//     required this.usuarioId,
//     required this.estado,
//     required this.tipo,
//     this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.estadoPropuesta,
//     required this.categorias,
//     required this.imagenes,
//     required this.usuario,
//   });

//   int id;
//   String tituloCamba;
//   String descripcion;
//   String precioEstimado;
//   int usuarioId;
//   String estado;
//   String tipo;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String estadoPropuesta;
//   List<Categoria> categorias;
//   List<Imagene> imagenes;
//   Usuario usuario;

//   factory Original.fromJson(Map<String, dynamic> json) => Original(
//         id: json["id"],
//         tituloCamba: json["titulo_camba"],
//         descripcion: json["descripcion"],
//         precioEstimado: json["precio_estimado"],
//         usuarioId: json["usuario_id"],
//         estado: json["estado"],
//         tipo: json["tipo"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         estadoPropuesta: json["estado_propuesta"],
//         categorias: List<Categoria>.from(
//             json["categorias"].map((x) => Categoria.fromJson(x))),
//         imagenes: List<Imagene>.from(
//             json["imagenes"].map((x) => Imagene.fromJson(x))),
//         usuario: Usuario.fromJson(json["usuario"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "titulo_camba": tituloCamba,
//         "descripcion": descripcion,
//         "precio_estimado": precioEstimado,
//         "usuario_id": usuarioId,
//         "estado": estado,
//         "tipo": tipo,
//         "deleted_at": deletedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "estado_propuesta": estadoPropuesta,
//         "categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
//         "imagenes": List<dynamic>.from(imagenes.map((x) => x.toJson())),
//         "usuario": usuario.toJson(),
//       };
// }

// class Categoria {
//   Categoria({
//     required this.id,
//     required this.nombreCategoria,
//     required this.pathImg,
//     required this.estadoCategoria,
//     required this.padreId,
//     required this.principal,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.pivot,
//   });

//   int id;
//   String nombreCategoria;
//   String pathImg;
//   EstadoCategoria estadoCategoria;
//   int padreId;
//   Principal principal;
//   dynamic createdAt;
//   dynamic updatedAt;
//   Pivot pivot;

//   factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
//         id: json["id"],
//         nombreCategoria: json["nombre_categoria"],
//         pathImg: json["path_img"],
//         estadoCategoria: estadoCategoriaValues.map[json["estado_categoria"]],
//         padreId: json["padre_id"],
//         principal: principalValues.map[json["principal"]],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         pivot: Pivot.fromJson(json["pivot"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nombre_categoria": nombreCategoria,
//         "path_img": pathImg,
//         "estado_categoria": estadoCategoriaValues.reverse[estadoCategoria],
//         "padre_id": padreId,
//         "principal": principalValues.reverse[principal],
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "pivot": pivot.toJson(),
//       };
// }

// enum EstadoCategoria { ACTIVO }

// final estadoCategoriaValues = EnumValues({"Activo": EstadoCategoria.ACTIVO});

// class Pivot {
//   Pivot({
//     required this.cambaPropuestaId,
//     required this.categoriaId,
//   });

//   int cambaPropuestaId;
//   int categoriaId;

//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//         cambaPropuestaId: json["camba_propuesta_id"],
//         categoriaId: json["categoria_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "camba_propuesta_id": cambaPropuestaId,
//         "categoria_id": categoriaId,
//       };
// }

// enum Principal { SI, NO }

// final principalValues = EnumValues({"No": Principal.NO, "Si": Principal.SI});

// class Imagene {
//   Imagene({
//     required this.id,
//     required this.cambaPropuestaId,
//     required this.pathImagen1920,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.pathImagen1280,
//     required this.pathImagen640,
//   });

//   int id;
//   int cambaPropuestaId;
//   String pathImagen1920;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String pathImagen1280;
//   String pathImagen640;

//   factory Imagene.fromJson(Map<String, dynamic> json) => Imagene(
//         id: json["id"],
//         cambaPropuestaId: json["camba_propuesta_id"],
//         pathImagen1920: json["path_imagen_1920"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         pathImagen1280: json["path_imagen_1280"],
//         pathImagen640: json["path_imagen_640"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "camba_propuesta_id": cambaPropuestaId,
//         "path_imagen_1920": pathImagen1920,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "path_imagen_1280": pathImagen1280,
//         "path_imagen_640": pathImagen640,
//       };
// }

// class Usuario {
//   Usuario({
//     required this.id,
//     required this.name,
//     required this.userName,
//     required this.email,
//     required this.emailVerifiedAt,
//     required this.activo,
//     required this.tokenValidacion,
//     required this.admin,
//     required this.telefono,
//     required this.imagePath,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   int id;
//   String name;
//   String userName;
//   String email;
//   DateTime emailVerifiedAt;
//   String activo;
//   String tokenValidacion;
//   String admin;
//   String telefono;
//   String imagePath;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
//         id: json["id"],
//         name: json["name"],
//         userName: json["user_name"],
//         email: json["email"],
//         emailVerifiedAt: json["email_verified_at"] == null
//             ? null
//             : DateTime.parse(json["email_verified_at"]),
//         activo: json["activo"],
//         tokenValidacion: json["token_validacion"],
//         admin: json["admin"],
//         telefono: json["telefono"],
//         imagePath: json["image_path"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "user_name": userName,
//         "email": email,
//         "email_verified_at":
//             emailVerifiedAt == null ? null : emailVerifiedAt.toIso8601String(),
//         "activo": activo,
//         "token_validacion": tokenValidacion,
//         "admin": admin,
//         "telefono": telefono,
//         "image_path": imagePath,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
