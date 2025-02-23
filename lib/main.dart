import 'package:flutter/material.dart';
import 'package:mini_project/pages/applyElec.dart';
import 'package:mini_project/pages/forgotPass.dart';
import 'package:mini_project/pages/homeW.dart';
import 'package:mini_project/pages/page1.dart';
import 'package:mini_project/pages/page2.dart';
import 'package:mini_project/pages/page3.dart';
import 'package:mini_project/pages/login.dart';
import 'package:mini_project/pages/profile.dart';
import 'package:mini_project/pages/profileE.dart';
import 'package:mini_project/pages/signup.dart';
import 'package:mini_project/pages/otp.dart';
import 'package:mini_project/pages/setPassword.dart';
import 'package:mini_project/pages/successful.dart';
import 'package:mini_project/pages/homeE.dart';
import 'package:mini_project/pages/applyWel.dart';
import 'package:mini_project/pages/applyFarmer.dart';
import 'package:mini_project/pages/applyPharm.dart';
import 'package:mini_project/pages/applyTech.dart';
import 'package:mini_project/pages/applyMason.dart';
import 'package:mini_project/pages/applyCarp.dart';
import 'package:mini_project/pages/applyPlum.dart';
import 'package:mini_project/pages/applyJob.dart';
import 'package:mini_project/pages/succAppl.dart';


void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/succAppl',
        routes: {
          '/' : (context) => Page1(),
          '/page2' : (context) => Page2(),
          '/page3' : (context) => Page3(),
          '/login' : (context) => Login(),
          '/signup' : (context) => SignUp(),
          '/profile' : (context) => Profile(),
          '/profileE' : (context) => ProfileE(),
          '/forgotPass' : (context) => ForgotPass(),
          '/otp' : (context) => Otp(),
          '/setPassword' : (context) => SetPassword(),
          '/successful' : (context) => Successful(),
          '/homeW' : (context) => HomeW(),
          '/homeE' : (context) => HomeE(),
          '/applyElec' : (context) => ApplyElectrician(),
          '/applyWel' : (context) => ApplyWelder(),
          '/applyFarmer' : (context) => ApplyFarmer(),
          '/applyPharm' : (context) => ApplyPharmacist(),
          '/applyTech' : (context) => ApplyTechnician(),
          '/applyMason' : (context) => ApplyMason(),
          '/applyCarp' : (context) => ApplyCarpenter(),
          '/applyPlum' : (context) => ApplyPlumber(),
          '/applyJob' : (context) => ApplyJob(),
          '/succAppl' : (context) => SuccessfulApplication(),
        },
    )
);