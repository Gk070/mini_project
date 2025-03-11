import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController _emailController = TextEditingController();

  void _showCupertinoAlert(String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _sendOTP() async {
    String email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      _showCupertinoAlert("Enter a valid email address");
      return;
    }

    String otp = (Random().nextInt(90000) + 10000).toString(); // Generate 5-digit OTP
    String docId = "OymujHD68d8kqRY2ZQIb"; // Fixed document ID

    try {
      await FirebaseFirestore.instance.collection("otp_verification").doc(docId).set({
        "email": email,
        "otp": otp,
        "timestamp": FieldValue.serverTimestamp(),
      });

      // Call function to send OTP via email (Placeholder)
      sendEmailOTP(email, otp);

      Navigator.pushNamed(context, '/otp', arguments: email);
    } catch (e) {
      _showCupertinoAlert("Failed to send OTP. Try again.");
    }
  }

  // Placeholder for sending OTP via email
  void sendEmailOTP(String email, String otp) {
    print("OTP sent to $email: $otp"); // Replace with SendGrid/AWS SES
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.indigo[800]),
            ),
            SizedBox(height: 20.0),
            Text(
              "Please enter your email to receive an OTP",
              style: TextStyle(fontSize: 15.0, color: Colors.indigoAccent[100]),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Enter your email",
                hintText: "example@mail.com",
                filled: true,
                fillColor: Colors.indigo[50],
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigoAccent)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo, width: 2)),
              ),
            ),
            SizedBox(height: 25.0),
            Center(
              child: ElevatedButton(
                onPressed: _sendOTP,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                child: Text('Send OTP', style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
