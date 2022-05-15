import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app1/cancionesmodell.dart';

import 'package:audioplayers/audioplayers.dart';

class ReproductorPage extends StatefulWidget {
  final List<cancion> canciones;
  final int index;
  final player = AudioCache();

  ReproductorPage({Key? key, required this.canciones, required this.index})
      : super(key: key);

  @override
  State<ReproductorPage> createState() => _ReproductorPageState();
}

class _ReproductorPageState extends State<ReproductorPage> {
  double _valorbarra = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: PageView(
              children: widget.canciones
                  .map((canciones) => imagendefondo(canciones))
                  .toList(),
            ),
          ),
          filtro(),
          Column(
            children: <Widget>[
              appbar(),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 270,
                child: PageView(
                  controller: PageController(viewportFraction: 0.8),
                  children: widget.canciones
                      .map((canciones) => portada(canciones))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              subtitulo(),
              BARRAmusic(),
              SizedBox(
                height: 20,
              ),
              Container(
                child: PageView(
                  children: widget.canciones
                      .map((canciones) => botones(canciones))
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget imagendefondo(cancion canciones) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1c1e2c),
        image: DecorationImage(
            image: AssetImage(widget.canciones[0].imagen),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop)),
      ),
    );
  }

  Widget filtro() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
      child: Container(color: Colors.black.withOpacity(0.4)),
    );
  }

  Widget appbar() {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "MUSIC PLAY",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text(
                      "1000 SONGS | + 1.3 M FAVORITES",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget portada(cancion canciones) {
    return Card(
      child: Container(
        height: 250,
        width: 300,
        child: Image.asset(
          canciones.imagen,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget subtitulo() {
    return Container(
      height: 60,
      child: Column(
        children: <Widget>[
          Text(
            widget.canciones[0].titulo,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget BARRAmusic() {
    return Container(
      child: Column(
        children: <Widget>[
          Slider(
            value: _valorbarra,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }

  onChanged(double value) {
    setState(() {
      _valorbarra = value;
    });
  }

  Widget botones(cancion canciones) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.fast_rewind,
            color: Colors.grey,
            size: 40,
          ),
          SizedBox(
            width: 30,
          ),
          IconButton(
            onPressed: () {
              final player = AudioCache();
              player.play(widget.canciones[0].audio);
            },
            icon: Icon(Icons.play_arrow),
            iconSize: 40,
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.stop),
            iconSize: 40,
            color: Colors.blue,
          ),
          SizedBox(
            width: 30,
          ),
          Icon(
            Icons.fast_forward,
            color: Colors.grey,
            size: 40,
          ),
        ],
      ),
    );
  }
}
