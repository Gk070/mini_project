import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{

  String email = '';
  String password = '';
  String confirmPassword= '';
  String ch ='';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePassword(){
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPassword(){
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
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
                    "Ok"
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
    if(email.isEmpty || password.isEmpty || confirmPassword.isEmpty || ch.isEmpty){
      _showCupertinoAlert("All fields are mandatory");
    }
    else if(password != confirmPassword){
      _showCupertinoAlert("Password not matching");
    }
    else{
      Navigator.pushNamed(context, '/login');
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
            "Create Account",
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
            height: 20.0,
          ),
          Text(
            "Create an account so you can explore all the",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              letterSpacing: 1.0,
              color: Colors.black,
            ),
            //style: ,
          ),
          Text(
            "existing jobs",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
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
                keyboardType: TextInputType.emailAddress,
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
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
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
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
            child: TextField(
                decoration: InputDecoration(
                  label: Text("Confirm Password"),
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigoAccent,
                      )
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureConfirmPassword ? Icons.lock : Icons.lock_open
                    ),
                    onPressed: () {
                      _toggleConfirmPassword();
                    },
                  ),
                ),
                obscureText: _obscureConfirmPassword,
                onChanged: (value){
                  setState(() {
                    confirmPassword = value;
                  });
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Type(Employer, Worker, Both)"),
                  hintText: "E/ W/ B",
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
                'Sign up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, '/login');
              });
            },
            child: Text(
              'Already have an account',
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