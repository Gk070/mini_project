import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String category = '';
  String district = '';
  String place = '';
  RangeValues values = const RangeValues(500, 100000);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Category"),
                  hintText: "Carpenter",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigoAccent,
                  )),
                ),
                onChanged: (value) {
                  setState(() {
                    category = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("District"),
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
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Place"),
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
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, .0, 30.0, 0.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/homeW');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.fromLTRB(105.0, 15.0, 107.0, 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              child: Text(
                'Apply Changes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
