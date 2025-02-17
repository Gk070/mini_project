import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  String email = '';
  String password = '';
  bool _obscurepassword = true;

  void _togglePassword(){
    setState(() {
      _obscurepassword = !_obscurepassword;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Login Here",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              letterSpacing: 1.0,
              color: Colors.indigo[500],
            ),
            //style: ,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Welcome back you've",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.black,
            ),
            //style: ,
          ),
          Text(
              "been missed!",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Colors.black,
              ),
            ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 8.0, 35.0, 8.0),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Email"),
                hintText: "amalkrishna@gmail.com",
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )
                ),
              ),
              onChanged: (value){
                setState(() {
                  email = value;
                });
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 8.0, 35.0, 8.0),
            child: TextField(
                decoration: InputDecoration(
                  label: Text("Password"),
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigoAccent,
                      )
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurepassword ? Icons.lock : Icons.lock_open
                    ),
                    onPressed: () {
                      _togglePassword();
                    },
                  ),
                ),
                obscureText: _obscurepassword,
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                }
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(180.0, 0.0, 0.0, 0.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot your Password?',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.indigo[500],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, .0, 30.0, 0.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.fromLTRB(150.0, 15.0, 150.0, 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Create new account',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.indigo[500],
                ),
              ),
            ),
          SizedBox(
            height: 200.0,
          ),
        ],
      ),
    );
  }
}