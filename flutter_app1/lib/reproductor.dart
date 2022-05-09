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
  int indicedisco = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          imagendefondo(),
          filtro(),
          Column(
            children: <Widget>[
              appbar(),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 300,
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      indicedisco = index;
                    });
                  },
                  controller: PageController(viewportFraction: 0.8),
                  children: <Widget>[
                    portada(),
                  ],
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
              botones(),
            ],
          ),
        ],
      ),
    );
  }

  Widget imagendefondo() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1c1e2c),
        image: DecorationImage(
            image: AssetImage('assets/rude.jpg'),
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

  Widget portada() {
    return Card(
      child: Container(
        height: 250,
        width: 350,
        child: Image.asset(
          "assets/rude.jpg",
          fit: BoxFit.cover,
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

  Widget botones() {
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
          Icon(
            Icons.play_arrow,
            color: Colors.blue,
            size: 50,
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
