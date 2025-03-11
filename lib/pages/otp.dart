import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  final String email;
  final String documentId; // Add documentId to the constructor

  Otp({required this.email, required this.documentId}); // Update constructor

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  void _verifyOTP() async {
    setState(() {
      isLoading = true;
    });

    String enteredOtp = _otpController.text.trim();
    if (enteredOtp.isEmpty) {
      _showAlert("Enter OTP");
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      // Fetch the OTP from the specific document using the document ID
      DocumentSnapshot documentSnapshot = await _firestore
          .collection("otp_verification")
          .doc(widget.documentId) // Use the document ID passed from the constructor
          .get();

      if (!documentSnapshot.exists) {
        _showAlert("No OTP found for this document");
      } else {
        String storedOtp = documentSnapshot['otp']; // Get OTP from the document
        if (enteredOtp == storedOtp) {
          _showAlert("OTP Verified!");
          Navigator.pushNamed(context, '/setPassword', arguments: widget.email);
        } else {
          _showAlert("Invalid OTP");
        }
      }
    } catch (error) {
      _showAlert("Error verifying OTP: $error");
    }

    setState(() {
      isLoading = false;
    });
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Notification"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP"), backgroundColor: Colors.indigo),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("OTP sent to ${widget.email}"),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _verifyOTP,
              child: Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}