import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddJob extends StatefulWidget {
  _AddJobState createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  final TextEditingController _jobNameController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String _jobName = '';
  String _district = '';
  String _place = '';
  String _price = '';

  void _checkEmpty() {
    if (_jobNameController.text.isEmpty ||
        _districtController.text.isEmpty ||
        _placeController.text.isEmpty ||
        _priceController.text.isEmpty) {
      _showCupertinoAlert("All fields are mandatory");
    } else {
      Navigator.pushNamed(context, '/succJob');
    }
  }

  void _showCupertinoAlert(String message) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Invalid Credentials"),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                controller: _jobNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Job Nme"),
                  hintText: "ex: Electrician",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigoAccent,
                      )),
                ),
                onSubmitted: (value) {
                  _jobName = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Price"),
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigoAccent,
                      )),
                ),
                onSubmitted: (value) {
                  _price = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                controller: _districtController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("District"),
                  hintText: "ex: Pathanamthitta",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigoAccent,
                      )),
                ),
                onSubmitted: (value) {
                  _district = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                controller: _placeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Place"),
                  hintText: "ex: Adoor",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigoAccent,
                      )),
                ),
                onSubmitted: (value) {
                  _place = value;
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, .0, 20.0, 0.0),
              child: TextButton(
                onPressed: () {
                  _checkEmpty();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo[500],
                  padding: EdgeInsets.fromLTRB(136.0, 15.0, 136.0, 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
