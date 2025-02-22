import 'package:flutter/material.dart';

class MainBox extends StatefulWidget {
  final String image;
  final String price;
  final String jobPos;
  final String location;

  const MainBox({
    Key? key,
    required this.image,
    required this.price,
    required this.jobPos,
    required this.location
}) : super(key : key);

  @override
  _MainBoxState createState() => _MainBoxState();
}

class _MainBoxState extends State<MainBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo[700],
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
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              ),
              SizedBox(
                width: 80.0,
              ),
              Text(
                widget.price,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            widget.jobPos,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 10.0,
              letterSpacing: 1.0,
              color: Colors.white,
            ),
            //style: ,
          ),
          Row(
            children: [
              Text(
                widget.location,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  letterSpacing: 1.0,
                  color: Colors.white,
                ),
                //style: ,
              ),
              SizedBox(
                width: 40.0,
              ),
              Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
