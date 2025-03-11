import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/firebase_options.dart';
import 'package:mini_project/pages/applyElec.dart';
import 'package:mini_project/pages/filter.dart';
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
import 'package:mini_project/pages/addJob.dart';
import 'package:mini_project/pages/successfulJob.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://wcnksbasbjjyhghfaevb.supabase.co', // Replace with your actual Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndjbmtzYmFzYmpqeWhnaGZhZXZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE2ODE3MDEsImV4cCI6MjA1NzI1NzcwMX0.qF6OuptVuzuzU0JlLtqSwJkvblZPTt_lADxw9mbqoik', // Replace with your actual Supabase anon key
  );
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/otp':
              final email = settings.arguments as String;
              return MaterialPageRoute(builder: (context) => Otp(email: email));

            case '/setPassword':
              final email = settings.arguments as String;
              return MaterialPageRoute(builder: (context) => SetPassword(email: email));

            default:
              return null;
          }
        },
        routes: {
          '/' : (context) => Page1(),
          '/page2' : (context) => Page2(),
          '/page3' : (context) => Page3(),
          '/login' : (context) => Login(),
          '/signup' : (context) => SignUp(),
          '/profile' : (context) => Profile(),
          '/profileE' : (context) => ProfileE(),
          '/forgotPass' : (context) => ForgotPass(),
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
          '/filter' : (context) => Filter(),
          '/addJob' : (context) => AddJob(),
          '/succJob' : (context) => SuccessfulJob(),
        },
      )
  );
}