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
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final AuthServices _authService = AuthServices();

  void _signup() async {
    String? result = await _authService.signUp(
      emailId: _emailController.text,
      password: _passwordController.text,
      role: _roleController.text,
    );

    if (result == null) {
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("SignUp Failed: $result"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _togglePassword() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _toggleConfirmPassword() {
    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
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
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  void _validateAndSignup() {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        _roleController.text.isEmpty) {
      _showCupertinoAlert("All fields are mandatory");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      _showCupertinoAlert("Passwords do not match");
    } else {
      _signup();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Create Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.indigo[500],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Create an account so you can explore all the existing jobs",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.0, color: Colors.black),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "example@gmail.com",
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigoAccent),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: "Password",
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigoAccent),
                ),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: _togglePassword,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigoAccent),
                ),
                suffixIcon: IconButton(
                  icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: _toggleConfirmPassword,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _roleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Type (Employer or Worker)",
                hintText: "E / W",
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigoAccent),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: _validateAndSignup,
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 120.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text(
                'Already have an account? Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[500],
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
