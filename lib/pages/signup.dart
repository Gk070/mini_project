import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/services/authServices.dart';

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
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Instance for AuthService for Authentication process
  final AuthServices _authService = AuthServices();
  // Signup function to handle userRegistration
  void _signup() async {
    //call signup method from AuthService with user inputs
    String? result = await _authService.signUp(
      emailId: _emailController.text,
      password: _passwordController.text,
      role: _chController.text,
    );
    if (result == null) {
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("SignUp Failed $result")));
    }
  }

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

  void _checkEmpty() async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        _chController.text.isEmpty) {
      _showCupertinoAlert("All fields are mandatory");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      _showCupertinoAlert("Password not matching");
    } else {
      _signup();
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
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, .0, 30.0, 0.0),
            child: TextButton(
              onPressed: () async {
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
                'Sign Up',
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
