import 'package:flutter/material.dart';

class FullBox extends StatefulWidget {
  final String image1;
  final String price1;
  final String jobPos1;
  final String location1;
  final String image2;
  final String price2;
  final String jobPos2;
  final String location2;

  const FullBox({
    Key? key,
    required this.image1,
    required this.price1,
    required this.jobPos1,
    required this.location1,
    required this.image2,
    required this.price2,
    required this.jobPos2,
    required this.location2
  }) : super(key : key);

  @override
  _FullBoxState createState() => _FullBoxState();
}

class _FullBoxState extends State<FullBox> {

  void _checkPage(String jobPos){
    if (jobPos == 'Electrician') {
      Navigator.pushNamed(context, '/applyElec');
    } else if (jobPos == 'Plumber') {
      Navigator.pushNamed(context, '/applyPlum');
    } else if (jobPos == 'Carpenter') {
      Navigator.pushNamed(context, '/applyCarp');
    } else if (jobPos == 'Farmer') {
      Navigator.pushNamed(context, '/applyFarmer');
    } else if (jobPos == 'Mason') {
      Navigator.pushNamed(context, '/applyMason');
    } else if (jobPos == 'Pharmacist') {
      Navigator.pushNamed(context, '/applyPharm');
    } else if (jobPos == 'Technician') {
      Navigator.pushNamed(context, '/applyTech');
    } else if (jobPos == 'Welder') {
      Navigator.pushNamed(context, '/applyWel');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: (){
            _checkPage(widget.jobPos1);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage(widget.image1),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                    ),
                    SizedBox(
                      width: 80.0,
                    ),
                    Icon(
                      Icons.bookmark,
                      color: Colors.black12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.jobPos1,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    letterSpacing: 1.0,
                    color: Colors.black,
                  ),
                  //style: ,
                ),
                Text(
                  widget.location1,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    letterSpacing: 1.0,
                    color: Colors.black,
                  ),
                  //style: ,
                ),
                Text(
                  widget.price1,
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        GestureDetector(
          onTap: () {
            _checkPage(widget.jobPos2);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage(widget.image2),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                    ),
                    SizedBox(
                      width: 80.0,
                    ),
                    Icon(
                      Icons.bookmark,
                      color: Colors.black12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.jobPos2,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    letterSpacing: 1.0,
                    color: Colors.black,
                  ),
                  //style: ,
                ),
                Text(
                  widget.location2,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    letterSpacing: 1.0,
                    color: Colors.black,
                  ),
                  //style: ,
                ),
                Text(
                  widget.price2,
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}