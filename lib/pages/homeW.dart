import 'package:flutter/material.dart';
import 'package:mini_project/services/authServices.dart';
import 'package:mini_project/util/fullbox.dart';
import 'package:mini_project/util/mainbox.dart';
import 'package:mini_project/util/subbox.dart';

class HomeW extends StatefulWidget {
  @override
  _HomeWState createState() => _HomeWState();
}

class _HomeWState extends State<HomeW> {
  String search = '';

  AuthServices _authServices = AuthServices();

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Akhil",
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
                    Text(
                      "Find Your Great Job",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        color: Colors.indigo[500],
                      ), //style: ,
                    ),
                  ],
                ),
                GestureDetector(
                  child: CircleAvatar(
                    radius: 20.0,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.indigoAccent,
                      width: 1.0,
                    )),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Text(
                        'Search a job',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                          color: Colors.indigo[500],
                        ),
                      ),
                      SizedBox(
                        width: 140.0,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/filter');
                        },
                        icon: Icon(
                          Icons.tune,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Suggested",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    letterSpacing: 1.0,
                    color: Colors.indigo[500],
                  ), //style: ,
                ),
                IconButton(
                  icon: Icon(
                    Icons.logout,
                  ),
                  onPressed: () {
                    _authServices.signOut();
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MainBox(
                    image: 'images/plumber.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Plumber',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  MainBox(
                    image: 'images/electrician.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Electrician',
                    location: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  MainBox(
                    image: 'images/welder.jpg',
                    price: '₹900 - ₹1200',
                    jobPos: 'Welder',
                    location: 'Pampady, Kottayam',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
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
                  FullBox(
                    image1: 'images/electrician.jpg',
                    price1: '₹900 - ₹1200',
                    jobPos1: 'Electrician',
                    location1: 'Pampady, Kottayam',
                    image2: 'images/plumber.jpg',
                    price2: '₹900 - ₹1200',
                    jobPos2: 'Plumber',
                    location2: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FullBox(
                    image1: 'images/welder.jpg',
                    price1: '₹900 - ₹1200',
                    jobPos1: 'Welder',
                    location1: 'Pampady, Kottayam',
                    image2: 'images/mason.jpg',
                    price2: '₹900 - ₹1200',
                    jobPos2: 'Mason',
                    location2: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FullBox(
                    image1: 'images/farmer.jpg',
                    price1: '₹900 - ₹1200',
                    jobPos1: 'Farmer',
                    location1: 'Pampady, Kottayam',
                    image2: 'images/pharmacist.jpg',
                    price2: '₹900 - ₹1200',
                    jobPos2: 'Pharmacist',
                    location2: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FullBox(
                    image1: 'images/carpenter.jpg',
                    price1: '₹900 - ₹1200',
                    jobPos1: 'Carpenter',
                    location1: 'Pampady, Kottayam',
                    image2: 'images/technician.jpg',
                    price2: '₹900 - ₹1200',
                    jobPos2: 'Technician',
                    location2: 'Pampady, Kottayam',
                  ),
                  SizedBox(
                    height: 15.0,
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