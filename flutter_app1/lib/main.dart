import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/cancionesmodell.dart';
import 'package:flutter_app1/principal.dart';
import 'package:flutter_app1/reproductor.dart';
import 'package:flutter_app1/decorationlogin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepagepState();
}

class _homepagepState extends State<homepage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return login();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user not found") {
        print("no user found for tha email");
      }
    }

    return user;
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [fondoazul(Size), icono(), loginform(context)],
        ),
      ),
    );
  }

  SingleChildScrollView loginform(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(23),
              //efecto de sombra
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          autocorrect: false,
                          decoration: InputDecorations.inputDecoration(
                              hintext: "ejemplo@gmail.com",
                              labeltext: "correo electronico",
                              icono: const Icon(Icons.alternate_email_rounded)),
                          validator: (value) {
                            String pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = new RegExp(pattern);
                            return regExp.hasMatch(value ?? '')
                                ? null
                                : "el valor ingresado no es un correo";
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecorations.inputDecoration(
                              hintext: "*********",
                              labeltext: "contraseña",
                              icono: const Icon(Icons.lock_outlined)),
                          validator: (value) {
                            return (value != null && value.length >= 8)
                                ? null
                                : "la contraseña debe ser mayor o igual a 8 caracteres";
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Colors.grey,
                          color: Colors.blue,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            child: const Text(
                              "Ingresar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () async {
                            User? user = await loginUsingEmailPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                                context: context);
                            print(user);
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => principals()));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Registrar Cuenta",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  SafeArea icono() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 70),
        width: double.infinity,
        child: const Icon(
          Icons.audiotrack,
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }

  Container fondoazul(Size Size) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: Size.height * 0.4,
      child: Stack(
        children: [
          Positioned(child: burbuja(), top: 90, left: 20),
          Positioned(child: burbuja(), top: -40, left: -30),
          Positioned(child: burbuja(), top: -15, left: 250),
          Positioned(child: burbuja(), top: 150, left: 290),
          Positioned(child: burbuja(), bottom: -40, left: 120),
        ],
      ),
    );
  }

  Container burbuja() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}


























 // routes: {
      //   'login': (_) => loginpage(),
      //   'home': (_) => principals(),
      // },
      // initialRoute: "login",
























































































































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
