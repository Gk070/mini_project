import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController _emailController = TextEditingController();

  String _email = '';

  void _showCupertinoAlert(String message) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Invalid Credentials'),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  'Ok',
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void _checkEmpty() {
    if (_emailController.text.isEmpty) {
      _showCupertinoAlert("All fields are mandatory");
    } else {
      Navigator.pushNamed(context, '/otp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "    Forgot Password",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              letterSpacing: 1.0,
              color: Colors.indigo[800],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            "       Please enter your email to reset the password",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Colors.indigoAccent[100],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 8.0, 25.0, 8.0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text("Enter your email"),
                hintText: "ex: amalkrishna@gmail.com",
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.indigoAccent,
                )),
              ),
              onSaved: (value){
                _email = value!;
              },
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25.0, .0, 20.0, 0.0),
            child: TextButton(
              onPressed: () {
                _checkEmpty();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.fromLTRB(105.0, 15.0, 110.0, 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              child: Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 400.0,
          ),
        ],
      ),
    );
  }
}
