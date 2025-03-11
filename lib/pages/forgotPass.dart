import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Show Cupertino Alert Dialog
  void _showCupertinoAlert(String title, String message) {
    if (mounted) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title),
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
  }

  Future<void> _sendOTP() async {
    String email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      _showCupertinoAlert("Error", "Enter a valid email address");
      return;
    }

    // Generate a 5-digit OTP (00000 - 99999)
    String otp = (Random().nextInt(90000) + 10000).toString();
    String docId = "OymujHD68d8kqRY2ZQIb"; // Fixed Firestore document ID

    try {
      debugPrint("📤 Sending OTP to Firestore...");

      // Store OTP in Firestore
      await _firestore.collection("otp_verification").doc(docId).set({
        "email": email,
        "otp": otp,
        "timestamp": FieldValue.serverTimestamp(),
      });

      debugPrint("✅ OTP stored successfully: $otp");

      // Show success message
      _showCupertinoAlert("Success", "OTP sent successfully to $email");

      // Delay navigation for 1 second so the alert can be seen
      Future.delayed(Duration(seconds: 1), () {
        if (mounted) {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            '/otp',  // ❌ This should be '/setPassword' instead!
            arguments: {
              'email': email,
              'documentId': docId,
            },
          );// Close the alert before navigating
        }
      });

    } catch (e) {
      debugPrint("❌ Firestore Error: $e");
      _showCupertinoAlert("Error", "Failed to send OTP. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forgot Password", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo)),
            SizedBox(height: 20.0),
            Text("Enter your email to receive an OTP", style: TextStyle(fontSize: 15, color: Colors.indigoAccent[100])),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                filled: true,
                fillColor: Colors.indigo[50],
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigoAccent)),
              ),
            ),
            SizedBox(height: 25.0),
            Center(
              child: ElevatedButton(
                onPressed: _sendOTP,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                child: Text('Send OTP', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
