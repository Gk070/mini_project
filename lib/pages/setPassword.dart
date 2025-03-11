import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SetPassword extends StatefulWidget {
  final String email;
  SetPassword({required this.email});

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _resetPassword() async {
    String newPassword = _passwordController.text.trim();

    if (newPassword.length < 6) {
      _showAlert("Password must be at least 6 characters");
      return;
    }

    try {
      User? user = _auth.currentUser;
      await user?.updatePassword(newPassword);
      _showAlert("Password reset successfully!");
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      print("Error resetting password: $e");
      _showAlert("Failed to reset password. Try again.");
    }
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Notification"),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("OK")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Set New Password"), backgroundColor: Colors.indigo),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Enter New Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
