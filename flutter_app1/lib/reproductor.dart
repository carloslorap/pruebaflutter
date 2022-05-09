import 'package:flutter/material.dart';
import 'package:flutter_app1/cancionesmodell.dart';

class ReproductorPage extends StatefulWidget {
  final List<cancion> canciones;
  final int index;

  const ReproductorPage(
      {Key? key, required this.canciones, required this.index})
      : super(key: key);

  @override
  State<ReproductorPage> createState() => _ReproductorPageState();
}

class _ReproductorPageState extends State<ReproductorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
