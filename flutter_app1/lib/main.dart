import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'music',
      home: Scaffold(
        appBar: AppBar(title: const Text('MUSIC PLAY')),
        body: const Center(
          child: MyStatelessWidget(),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: <Widget>[
            imagenfondo(context),
            customAppbar(),
            subtitulo(context),
          ]),
          Expanded(
              child: ListView(
            children: <Widget>[
              itemaudio(),
              itemaudio(),
              itemaudio(),
              itemaudio(),
              itemaudio(),
              itemaudio(),
            ],
          ))
        ],
      ),
    );
  }
}

Widget imagenfondo(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 1.8,
    width: MediaQuery.of(context).size.width / 1,
    child: Image.network(
      "https://www.clipartkey.com/mpngs/m/276-2767912_music-maker-online-create-music-logo-png-hd.png",
    ),
  );
}

Widget customAppbar() {
  return Container(
    height: 70,
    padding: EdgeInsets.all(13),
    color: Colors.transparent,
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
        )
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

Widget itemaudio() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    color: Colors.transparent,
    height: 90,
    child: Row(children: <Widget>[
      Text('01', style: TextStyle(color: Colors.grey)),
      SizedBox(
        width: 20,
      ),
      Container(
        height: 70,
        width: 100,
        child: Image.network(
            "https://i.ytimg.com/vi/PIh2xe4jnpk/maxresdefault.jpg"),
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('MAGIG! - Rude(official video)'),
        ],
      ),
      Spacer(),
      Icon(Icons.arrow_downward),
      Icon(Icons.more_vert),
    ]),
  );
}