import 'package:flutter/material.dart';

class Successful extends StatefulWidget{
  @override
  _SuccessfulState createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.blue[50],
            child: Icon(
              Icons.check,
              color: Colors.blue[200],
              size: 30.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Successful",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.indigoAccent,
            ), //style: ,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Congratulations! Your password has",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              letterSpacing: 1.0,
              color: Colors.indigoAccent[100],
            ),
          ),
          Text(
            "been changed. Click continue to login",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              letterSpacing: 1.0,
              color: Colors.indigoAccent[100],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, .0, 30.0, 0.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.fromLTRB(105.0, 15.0, 110.0, 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              child: Text(
                'Back To Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300.0,
          ),
        ],
      ),
    );
  }
}