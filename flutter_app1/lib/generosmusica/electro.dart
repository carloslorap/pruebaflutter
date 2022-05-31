import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/widgets_menu.dart';
import 'package:flutter_app1/principal.dart';

class electros extends StatefulWidget {
  const electros({Key? key}) : super(key: key);

  @override
  State<electros> createState() => _electrosState();
}

class _electrosState extends State<electros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MenuLateral(),
    );
  }
}
