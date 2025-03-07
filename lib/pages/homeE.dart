import 'package:flutter/material.dart';
import 'package:mini_project/util/mainboxE.dart';
import 'package:mini_project/util/subbox.dart';

class HomeE extends StatefulWidget {
  @override
  _HomeEState createState() => _HomeEState();
}

class _HomeEState extends State<HomeE> {
  String username = "user";
  String search = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello, $username",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                    color: Colors.indigo[400],
                  ), //style: ,
                ),
                SizedBox(
                  height: 5.0,
                ),
                GestureDetector(
                  child: CircleAvatar(
                    radius: 20.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/profileE');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SubBox(
                    type: 'All Jobs',
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  SubBox(
                    type: 'Plumber',
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  SubBox(
                    type: 'Technician',
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  SubBox(
                    type: 'Electrician',
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  SubBox(
                    type: 'Carpenter',
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  SubBox(
                    type: 'Mason',
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  MainBoxE(
                    image: 'images/plumber.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Plumber',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/electrician.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Electrician',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/welder.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Welder',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/plumber.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Plumber',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/electrician.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Electrician',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/welder.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Welder',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/plumber.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Plumber',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/electrician.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Electrician',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/welder.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Welder',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/plumber.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Plumber',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/electrician.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Electrician',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MainBoxE(
                    image: 'images/welder.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Welder',
                    location: 'Pampady, Kottayam',
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addJob');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.fromLTRB(125.45, 15.0, 125.45, 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Add Jobs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
