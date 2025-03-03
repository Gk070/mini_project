import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeE extends StatefulWidget {
  @override
  _HomeEState createState() => _HomeEState();
}

class _HomeEState extends State<HomeE> {
  String jobPos = '';
  String district = '';
  String place = '';
  String workers = '';
  String wage = '';
  String exp = '';
  String jobDesc = '';

  void _checkEmpty() {
    if (jobPos.isEmpty ||
        district.isEmpty ||
        place.isEmpty ||
        workers.isEmpty ||
        wage.isEmpty ||
        exp.isEmpty ||
        jobDesc.isEmpty) {
      _showCupertinoAlert("All fields are mandatory");
    } else {}
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
        title: Text(
          '',
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Job Type"),
                  hintText: "ex: Plumbing...",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onChanged: (value) {
                  setState(() {
                    jobPos = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("District"),
                  hintText: "ex: Pathanamthitta....",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onChanged: (value) {
                  setState(() {
                    district = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Place"),
                  hintText: "ex: Adoor..",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onChanged: (value) {
                  setState(() {
                    place = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Workers Required"),
                  hintText: "ex: 1, 2..",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onChanged: (value) {
                  setState(() {
                    workers = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Wage"),
                  hintText: "ex: 1000, 2000....",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onChanged: (value) {
                  setState(() {
                    wage = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Experience"),
                  hintText: "ex: 0, 1, ....",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onChanged: (value) {
                  setState(() {
                    place = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Job Description"),
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onChanged: (value) {
                  setState(() {
                    place = value;
                  });
                }),
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
                padding: EdgeInsets.fromLTRB(143.0, 15.0, 143.0, 15.0),
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
    );
  }
}
