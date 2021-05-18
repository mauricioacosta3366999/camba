// import 'package:flutter/material.dart';

// import 'Api/Models/obtenerCambas.dart';
// import 'Api/consultas.dart';

// class ConsultasPO extends StatefulWidget {
//   @override
//   _ConsultasPOState createState() => _ConsultasPOState();
// }

// class _ConsultasPOState extends State<ConsultasPO> {
//   CambasModel? cambasModel;

//   llamar() async {
//     var filter = "Bicicletas";
//     cambasModel = await Consultas().getCambas(filter);
//     print("en la vista");
//     print("en la vista ${cambasModel?.code}");
//     print(
//         "en la vista ${cambasModel?.message?.cambas?.original?[0].descripcion}");
//   }

//   @override
//   void initState() {
//     llamar();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text("data"),
//             Text("data"),
//             Text("data"),
//           ],
//         ),
//       ),
//     );
//   }
// }
