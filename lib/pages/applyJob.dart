import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ApplyJob extends StatefulWidget {

  @override
  _ApplyJobState createState() => _ApplyJobState();

}

class _ApplyJobState extends State<ApplyJob> {
  String name = '';
  String phn = '';
  String addr = '';
  String district = '';
  String place = '';
  String exp = '';

  void _checkEmpty() {
    if (name.isEmpty || phn.isEmpty || addr.isEmpty || district.isEmpty || place.isEmpty || exp.isEmpty) {
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
          onPressed: (){
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
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
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
                  onChanged: (value) {
                    setState(() {
                      phn = value;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
                  decoration: InputDecoration(
                    label: Text("Address"),
                    filled: true,
                    fillColor: Colors.indigo[50],
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.indigoAccent,
                        )),
                  ),
                  onChanged: (value) {
                    setState(() {
                      addr = value;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
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
                  onChanged: (value) {
                    setState(() {
                      exp = value;
                    });
                  }),
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
                  onChanged: (value) {
                    setState(() {
                      district = value;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
              child: TextField(
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
