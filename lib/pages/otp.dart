import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget{
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
            ''
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/forgotPass');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "    Check your Email",
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
            "       We sent a reset link to ***@gmail.com enter",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Colors.indigoAccent[100],
            ),
          ),
          Text(
            "       5 digit code that mentioned in the email",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Colors.indigoAccent[100],
            ),
          ),
          SizedBox(
            height: 150.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25.0, .0, 20.0, 0.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/setPassword');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.fromLTRB(122.0, 15.0, 123.0, 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              child: Text(
                'Verify Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Text(
                "       Haven't got the email yet?",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.indigoAccent[100],
                ),
              ),
              TextButton(
                  onPressed: (){},
                  child: Text(
                    'Resend email',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.deepOrange,
                      decorationThickness: 2,
                    ),
                  ),
              )
            ],
          ),
          SizedBox(
            height: 350.0,
          ),
        ],
      ),
    );
  }
}