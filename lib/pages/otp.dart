import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  final String email;
  Otp({required this.email});

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
      // 🔥 Query Firestore for OTP using email
      QuerySnapshot querySnapshot = await _firestore
          .collection("otp_verification")
          .where("email", isEqualTo: widget.email)
          .orderBy("timestamp", descending: true) // Get the latest OTP
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        _showAlert("No OTP found for this email");
      } else {
        String storedOtp = querySnapshot.docs.first['otp']; // Get OTP from latest document
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
