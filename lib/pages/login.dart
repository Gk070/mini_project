import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  String email = '';
  String password = '';
  String ch = '';
  bool _obscurePassword = true;

  void _togglePassword(){
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _showCupertinoAlert(String message){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context){
          return CupertinoAlertDialog(
            title: Text(
              "Invalid Credentials"
            ),
            content: Text(
              message
            ),
            actions: [
              CupertinoDialogAction(
                  child: Text(
                    'Ok'
                  ),
                onPressed: (){
                    Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }

  void _checkEmpty(){
    if(email.isEmpty || password.isEmpty || ch.isEmpty){
      _showCupertinoAlert("All fields are mandatory");
    }
    else if(ch == 'w' || ch == 'W'){
      Navigator.pushNamed(context, '/profile');
    }
    else if(ch == 'e' || ch == 'E'){
      Navigator.pushNamed(context, '/profileE');
    }
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
                hintText: "ex: amalkrishna@gmail.com",
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
                      _obscurePassword ? Icons.lock : Icons.lock_open
                    ),
                    onPressed: () {
                      _togglePassword();
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
            child: TextField(
                decoration: InputDecoration(
                  label: Text("Type(Employer, Worker)"),
                  hintText: "E/ W",
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
                    ch = value;
                  });
                }
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(180.0, 0.0, 0.0, 0.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgotPass');
              },
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
              onPressed: () {
                _checkEmpty();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.fromLTRB(135.0, 15.0, 135.0, 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              child: Text(
                'Log in',
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
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, '/signup');
                });
              },
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
            height: 150.0,
          ),
        ],
      ),
    );
  }
}