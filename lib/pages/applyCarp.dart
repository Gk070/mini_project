import 'package:flutter/material.dart';

class ApplyCarpenter extends StatefulWidget {
  @override
  _ApplyCarpenterState createState() => _ApplyCarpenterState();
}

class _ApplyCarpenterState extends State<ApplyCarpenter> {
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
                    'images/carpenter.jpg',
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
                          "CARPENTER",
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
                    ' • Measure, cut, and assemble wood and other materials.\n • Install doors, windows, and furniture.\n • Read and follow blueprints and technical drawings.\n • Ensure precision and quality in construction work.',
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
                    ' • Experience in carpentry or woodworking.\n • Knowledge of tools, materials, and safety procedures.\n • Physical strength and attention to detail.\n • Ability to work independently or in a team.',
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
