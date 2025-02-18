import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo[800],
        centerTitle: true,
      ),
      body: Column(
        
      ),
    );
  }
}