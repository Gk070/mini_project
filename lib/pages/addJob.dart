import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddJob extends StatefulWidget {
  @override
  _AddJobState createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  final TextEditingController _jobNameController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  /// Function to Add Job Data to Firestore
  void _addJob() async {
    if (_jobNameController.text.trim().isEmpty ||
        _districtController.text.trim().isEmpty ||
        _placeController.text.trim().isEmpty ||
        _priceController.text.trim().isEmpty) {
      _showCupertinoAlert("All fields are mandatory");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      User? user = _auth.currentUser; // Get logged-in user
      if (user == null) {
        _showCupertinoAlert("User not logged in!");
        return;
      }

      // Add job post with an auto-generated ID
      await _firestore.collection("job_posts").add({
        "jobName": _jobNameController.text.trim(),
        "district": _districtController.text.trim(),
        "place": _placeController.text.trim(),
        "price": _priceController.text.trim(),
        "email": user.email, // Store user email
        "timestamp": FieldValue.serverTimestamp(),
      });

      _showCupertinoAlert("Job added successfully!");
      _clearFields();
    } catch (e) {
      _showCupertinoAlert("Error adding job: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  /// Function to Clear Input Fields
  void _clearFields() {
    _jobNameController.clear();
    _districtController.clear();
    _placeController.clear();
    _priceController.clear();
  }

  /// Function to Show Cupertino Alert Dialog
  void _showCupertinoAlert(String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Notification"),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  /// UI Design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Job", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTextField(_jobNameController, "Job Name", "ex: Electrician"),
            _buildTextField(_priceController, "Price", "ex: ₹900 - ₹1200", TextInputType.number),
            _buildTextField(_districtController, "District", "ex: Pathanamthitta"),
            _buildTextField(_placeController, "Place", "ex: Adoor"),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _addJob,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              ),
              child: Text("Submit", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper Function to Build TextFields
  Widget _buildTextField(TextEditingController controller, String label, String hint, [TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.indigo[50],
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigoAccent)),
        ),
      ),
    );
  }
}
