import 'package:flutter/material.dart';
import 'package:mini_project/pages/forgotPass.dart';
import 'package:mini_project/pages/page1.dart';
import 'package:mini_project/pages/page2.dart';
import 'package:mini_project/pages/page3.dart';
import 'package:mini_project/pages/login.dart';
import 'package:mini_project/pages/profile.dart';
import 'package:mini_project/pages/profileW.dart';
import 'package:mini_project/pages/signup.dart';
import 'package:mini_project/pages/otp.dart';
import 'package:mini_project/pages/setPassword.dart';
import 'package:mini_project/pages/successful.dart';

void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/profileW',
        routes: {
          '/' : (context) => Page1(),
          '/page2' : (context) => Page2(),
          '/page3' : (context) => Page3(),
          '/login' : (context) => Login(),
          '/signup' : (context) => SignUp(),
          '/profile' : (context) => Profile(),
          '/profileW' : (context) => ProfileW(),
          '/forgotPass' : (context) => ForgotPass(),
          '/otp' : (context) => Otp(),
          '/setPassword' : (context) => SetPassword(),
          '/successful' : (context) => Successful(),
        },
    )
);