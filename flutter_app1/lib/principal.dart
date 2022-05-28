import 'package:flutter/material.dart';
import 'package:flutter_app1/cancionesmodell.dart';
import 'package:flutter_app1/reproductor.dart';
import 'package:flutter_app1/login.dart';

class principals extends StatefulWidget {
  const principals({Key? key}) : super(key: key);

  @override
  State<principals> createState() => _principalsState();
}

class _principalsState extends State<principals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            imagenfondo(context),
            customAppbar(context),
            subtitulo(context),
          ]),
          Expanded(
            child: ListView(
              children: canciones
                  .asMap()
                  .map((index, cancion) =>
                      MapEntry(index, itemaudio(context, cancion, index + 1)))
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget imagenfondo(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width / 1,
      child: Image.asset('assets/fondo.png'));
}

Widget customAppbar(BuildContext context) {
  return Container(
    height: 70,
    padding: EdgeInsets.all(13),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.menu,
          color: Colors.black,
        ),
        Spacer(),
        Icon(
          Icons.search,
          color: Colors.black,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
      ],
    ),
  );
}

Widget subtitulo(BuildContext context) {
  return Positioned(
      top: MediaQuery.of(context).size.height / 2.2,
      child: Container(
          child: Column(
        children: <Widget>[
          Text('music play',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          Text(
            '1000 SONGS | + 1.3 M FAVORITES',
            style: TextStyle(color: Colors.black, fontSize: 10),
          ),
        ],
      )));
}

Widget itemaudio(BuildContext context, cancion canciones, int index) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReproductorPage(
                    canciones: [canciones],
                    index: index - 1,
                  )));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.transparent,
      height: 90,
      child: Row(children: <Widget>[
        Text(index.toString(), style: TextStyle(color: Colors.grey)),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 70,
          width: 100,
          child: Image.asset(canciones.imagen),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(canciones.titulo),
          ],
        ),
      ]),
    ),
  );
}