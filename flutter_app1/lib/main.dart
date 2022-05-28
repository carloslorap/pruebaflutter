import 'package:flutter/material.dart';
import 'package:flutter_app1/cancionesmodell.dart';
import 'package:flutter_app1/principal.dart';
import 'package:flutter_app1/reproductor.dart';
import 'package:flutter_app1/login.dart';
import 'package:flutter_app1/decorationlogin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'music',
      routes: {
        'login': (_) => loginpage(),
        'home': (_) => principals(),
      },
      initialRoute: "login",
    );
  }
}





























































































































































//     Scaffold(
//       body: Column(
//         children: <Widget>[
//           login(context),
//           Stack(children: <Widget>[
//             imagenfondo(context),
//             customAppbar(context),
//             subtitulo(context),
//           ]),
//           Expanded(
//             child: ListView(
//               children: canciones
//                   .asMap()
//                   .map((index, cancion) =>
//                       MapEntry(index, itemaudio(context, cancion, index + 1)))
//                   .values
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget imagenfondo(BuildContext context) {
//   return Container(
//       height: MediaQuery.of(context).size.height / 1.8,
//       width: MediaQuery.of(context).size.width / 1,
//       child: Image.asset('assets/fondo.png'));
// }

// Widget customAppbar(BuildContext context) {
//   return Container(
//     height: 70,
//     padding: EdgeInsets.all(13),
//     child: Row(
//       children: <Widget>[
//         Icon(
//           Icons.menu,
//           color: Colors.black,
//         ),
//         Spacer(),
//         Icon(
//           Icons.search,
//           color: Colors.black,
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Icon(
//           Icons.more_vert,
//           color: Colors.black,
//         ),
//       ],
//     ),
//   );
// }

// Widget login(BuildContext context) {
//   return InkWell(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => loginpage()),
//       );
//     },
//     child: Container(
//       height: 40,
//       child: Column(children: <Widget>[
//         Text("login",
//             style: TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))
//       ]),
//     ),
//   );
// }

// Widget subtitulo(BuildContext context) {
//   return Positioned(
//       top: MediaQuery.of(context).size.height / 2.2,
//       child: Container(
//           child: Column(
//         children: <Widget>[
//           Text('music play',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30)),
//           Text(
//             '1000 SONGS | + 1.3 M FAVORITES',
//             style: TextStyle(color: Colors.black, fontSize: 10),
//           ),
//         ],
//       )));
// }

// Widget itemaudio(BuildContext context, cancion canciones, int index) {
//   return InkWell(
//     onTap: () {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => ReproductorPage(
//                     canciones: [canciones],
//                     index: index - 1,
//                   )));
//     },
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       color: Colors.transparent,
//       height: 90,
//       child: Row(children: <Widget>[
//         Text(index.toString(), style: TextStyle(color: Colors.grey)),
//         SizedBox(
//           width: 20,
//         ),
//         Container(
//           height: 70,
//           width: 100,
//           child: Image.asset(canciones.imagen),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(canciones.titulo),
//           ],
//         ),
//       ]),
//     ),
//   );
// }






















// Widget login(BuildContext context) {
//   return InkWell(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>
//         ),
//       );
//     },
//     child: Container(
//       height: 40,
//       child: Column(children: <Widget>[
//         Text("login",
//             style: TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))
//       ]),
//     ),
//   );
// }











// Image.network(
//       "https://www.clipartkey.com/mpngs/m/276-2767912_music-maker-online-create-music-logo-png-hd.png",
//     ),
