import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApplyJob extends StatefulWidget {
  @override
  _ApplyJobState createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phnController = TextEditingController();
  final TextEditingController _addrController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _expController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String applicationPath = "application/${FirebaseAuth.instance.currentUser?.uid}";

  @override
  void initState() {
    super.initState();
    _fetchApplicationData();
  }

  Future<void> _fetchApplicationData() async {
    try {
      DocumentSnapshot doc = await _firestore.doc(applicationPath).get();
      if (doc.exists) {
        setState(() {
          _nameController.text = doc['name'] ?? '';
          _phnController.text = doc['phone'] ?? '';
          _addrController.text = doc['address'] ?? '';
          _districtController.text = doc['district'] ?? '';
          _placeController.text = doc['place'] ?? '';
          _expController.text = doc['experience'] ?? '';
        });
      }
    } catch (e) {
      print("Error fetching application data: $e");
    }
  }

  void _submitApplication() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _firestore.doc(applicationPath).set({
          "name": _nameController.text,
          "phone": _phnController.text,
          "address": _addrController.text,
          "district": _districtController.text,
          "place": _placeController.text,
          "experience": _expController.text,
          "email": _auth.currentUser?.email,
          "timestamp": FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

        Navigator.pushNamed(context, '/succAppl');
      } catch (e) {
        print("Error submitting application: $e");
        _showCupertinoAlert("Failed to submit. Try again.");
      }
    }
  }

  void _showCupertinoAlert(String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Invalid Input"),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "APPLICATION FORM",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, letterSpacing: 1.0, color: Colors.white),
        ),
        backgroundColor: Colors.indigo[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_nameController, "Full Name", "ex: Imran Khan"),
              _buildTextField(_phnController, "Phone No", "ex: 9523423432", TextInputType.phone),
              _buildTextField(_addrController, "Address"),
              _buildTextField(_districtController, "District", "ex: Pathanamthitta"),
              _buildTextField(_placeController, "Place", "ex: Adoor"),
              _buildTextField(_expController, "Experience", "ex: 0, 1.. years", TextInputType.number),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitApplication,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                ),
                child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, [String hint = "", TextInputType type = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.indigo[50],
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigoAccent)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo, width: 2.0)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }
}