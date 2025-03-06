import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _chController = TextEditingController();
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _ch = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPassword() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _showCupertinoAlert(String message) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Invalid Credentials"),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void _checkEmpty() {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        _chController.text.isEmpty) {
      _showCupertinoAlert("All fields are mandatory");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      _showCupertinoAlert("Password not matching");
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  Future<void> createUser() async {
    try{
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }on FirebaseAuthException catch(e){
      print(e.message);
    }
  }


  @override
  Widget build(BuildContext context) {
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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text("Email"),
                hintText: "amalkrishna@gmail.com",
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.indigoAccent,
                )),
              ),
              onSubmitted: (value) {
                _email = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                label: Text("Password"),
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.indigoAccent,
                )),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.lock : Icons.lock_open),
                  onPressed: () {
                    _togglePassword();
                  },
                ),
              ),
              onSubmitted: (value) {
                _password = value;
              },
              obscureText: _obscurePassword,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
            child: TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                label: Text("Confirm Password"),
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.indigoAccent,
                )),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureConfirmPassword ? Icons.lock : Icons.lock_open),
                  onPressed: () {
                    _toggleConfirmPassword();
                  },
                ),
              ),
              onSubmitted: (value) {
                _confirmPassword = value;
              },
              obscureText: _obscureConfirmPassword,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: TextField(
              controller: _chController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text("Type(Employer, Worker, Both)"),
                hintText: "E/ W/ B",
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.indigoAccent,
                )),
              ),
              onSubmitted: (value) {
                _ch = value;
              },
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, .0, 30.0, 0.0),
            child: TextButton(
              onPressed: () async {
                await createUser();
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
                'Sign in',
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
