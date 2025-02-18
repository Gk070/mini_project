import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileE extends StatefulWidget{
  _ProfileEState createState() => _ProfileEState();
}

class _ProfileEState extends State<ProfileE>{
  String name = '';
  String phn = '';
  String district = '';
  String place = '';

  void _checkEmpty(){
    if(name.isEmpty || phn.isEmpty || district.isEmpty || place.isEmpty){
      _showCupertinoAlert("All fields are mandatory");
    }
    else{

    }
  }

  void _showCupertinoAlert(String message){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context){
          return CupertinoAlertDialog(
            title: Text(
                "Invalid Credentials"
            ),
            content: Text(
                message
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                    "Ok"
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }

  Widget build(BuildContext context){
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.upload,
                  ),
                ),
                Text(
                    'Upload image'
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0,10.0),
            child: TextField(
                decoration: InputDecoration(
                  label: Text("Full name"),
                  hintText: "ex: Imran Khan",
                  filled: true,
                  fillColor: Colors.indigo[50],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigoAccent,
                      )
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    name = value;
                  });
                }
            ),
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
                      )
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    phn = value;
                  });
                }
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
                      )
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    place = value;
                  });
                }
            ),
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
                      )
                  ),
                ),
                onChanged: (value){
                  setState(() {
                    place = value;
                  });
                }
            ),
          ),
          SizedBox(
            height: 20.0,
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
          SizedBox(
            height: 150.0,
          ),
        ],
      ),
    );
  }
}