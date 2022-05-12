import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: 50),
        children: <Widget>[
          Icon(
            Icons.audiotrack,
            size: 60,
          ),
          Divider(
            height: 50,
          ),
          Column(
            children: <Widget>[
              Text(
                "login",
                style: TextStyle(fontSize: 40),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "user name",
                    labelText: "user name",
                    suffixIcon: Icon(Icons.verified_user)),
              ),
              Divider(
                height: 50,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "password",
                    labelText: "password",
                    suffixIcon: Icon(Icons.lock_outline)),
              ),
              Divider(
                height: 20,
              ),
              SizedBox(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    "sing in ",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
