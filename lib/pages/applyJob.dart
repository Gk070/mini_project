import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ApplyJob extends StatefulWidget {
  @override
  _ApplyJobState createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phnController = TextEditingController();
  final TextEditingController _addrController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  String _name = '';
  String _phn = '';
  String _addr = '';
  String _district = '';
  String _place = '';
  String _exp = '';

  void _checkEmpty() {
    if (_nameController.text.isEmpty ||
        _phnController.text.isEmpty ||
        _addrController.text.isEmpty ||
        _districtController.text.isEmpty ||
        _placeController.text.isEmpty ||
        _expController.text.isEmpty) {
      _showCupertinoAlert("All fields are mandatory");
    } else {
      Navigator.pushNamed(context, '/succAppl');
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "APPLICATION FORM",
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
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Full Name"),
                  hintText: "ex: Imran Khan",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onSubmitted: (value) {
                  _name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _phnController,
                decoration: InputDecoration(
                  label: Text("Phone No"),
                  hintText: "ex: 9523423432",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onSubmitted: (value) {
                  _phn = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _addrController,
                decoration: InputDecoration(
                  label: Text("Address"),
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onSubmitted: (value) {
                  _addr = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _expController,
                decoration: InputDecoration(
                  label: Text("Experience"),
                  hintText: "ex: 0, 1.. years",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onSubmitted: (value) {
                  _exp = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.indigoAccent,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.upload_file),
                        onPressed: () {},
                      ),
                      Text('Upload ID Proof'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _districtController,
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
                keyboardType: TextInputType.text,
                controller: _placeController,
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
