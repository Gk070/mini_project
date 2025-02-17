import 'package:flutter/material.dart';
import 'package:mini_project/pages/page1.dart';
import 'package:mini_project/pages/page2.dart';
import 'package:mini_project/pages/page3.dart';
import 'package:mini_project/pages/login.dart';
import 'package:mini_project/pages/signup.dart';


void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/signup',
        routes: {
          '/' : (context) => Page1(),
          '/page2' : (context) => Page2(),
          '/page3' : (context) => Page3(),
          '/login' : (context) => Login(),
          '/signup' : (context) => SignUp(),
        },
    )
);