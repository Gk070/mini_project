import 'package:flutter/material.dart';

class MainBoxE extends StatefulWidget {
  final String image;
  final String price;
  final String jobPos;
  final String location;

  const MainBoxE(
      {Key? key,
        required this.image,
        required this.price,
        required this.jobPos,
        required this.location})
      : super(key: key);

  @override
  _MainBoxEState createState() => _MainBoxEState();
}

class _MainBoxEState extends State<MainBoxE> {
  void _checkPage() {
    if (widget.jobPos == 'Electrician') {
      Navigator.pushNamed(context, '/applyElec');
    } else if (widget.jobPos == 'Plumber') {
      Navigator.pushNamed(context, '/applyPlum');
    } else if (widget.jobPos == 'Carpenter') {
      Navigator.pushNamed(context, '/applyCarp');
    } else if (widget.jobPos == 'Farmer') {
      Navigator.pushNamed(context, '/applyFarmer');
    } else if (widget.jobPos == 'Mason') {
      Navigator.pushNamed(context, '/applyMason');
    } else if (widget.jobPos == 'Pharmacist') {
      Navigator.pushNamed(context, '/applyPharm');
    } else if (widget.jobPos == 'Technician') {
      Navigator.pushNamed(context, '/applyTech');
    } else if (widget.jobPos == 'Welder') {
      Navigator.pushNamed(context, '/applyWel');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _checkPage();
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
                    color: Colors.black,
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
                color: Colors.black,
              ),
              //style: ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.location,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    letterSpacing: 1.0,
                    color: Colors.black,
                  ),
                  //style: ,
                ),
                SizedBox(
                  width: 40.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
