import 'package:flutter/material.dart';

class ProfileW extends StatefulWidget{
  _ProfileWState createState() => _ProfileWState();
}

class _ProfileWState extends State<ProfileW>{
  String name = '';
  String phn = '';
  String district = '';
  String place = '';

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
                  label: Text("Jobs interested"),
                  hintText: "ex: Plumbing, Carpenter..",
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
                    district = value;
                  });
                }
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
                      icon: Icon(
                          Icons.upload_file
                      ),
                      onPressed: (){},
                    ),
                    Text(
                        'Upload document'
                    ),
                  ],
                ),
              ),
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
        ],
      ),
    );
  }
}