import 'package:flutter/material.dart';

class ApplyLaundry extends StatefulWidget {
  @override
  _ApplyLaundryState createState() => _ApplyLaundryState();
}

class _ApplyLaundryState extends State<ApplyLaundry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 450,
                width: double.infinity,
                child: Image(
                  image: AssetImage(
                    'images/laundry.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 350,
                right: 0.0,
                left: 0.0,
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                      bottom: Radius.circular(0.0),
                    ),
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "LAUNDRY",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            letterSpacing: 1.0,
                            color: Colors.indigo[800],
                          ),
                        ),
                        Text(
                          "Kochi, Ernakulam",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.indigo[800],
                          ),
                        ),
                        Text(
                          "₹1000 - ₹10000",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.indigo[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 406.727,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.indigo[800],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Job Description',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.indigo[500],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    ' • Wash and dry clothes properly.\n • Iron and fold garments neatly.\n • Sort laundry by fabric and color.\n • Remove stains using proper techniques.',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                      height: 20.0
                  ),
                  Text(
                    'Responsibilities',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.indigo[500],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    ' • Basic knowledge of laundry procedures.\n • Ability to handle washing machines and irons.\n • Attention to fabric care and stain removal.\n • Physically fit for lifting and sorting clothes.',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/applyJob');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.indigo[500],
                        padding: EdgeInsets.fromLTRB(132.0, 15.0, 132.0, 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                      child: Text(
                        'Apply Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
