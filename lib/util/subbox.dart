import 'package:flutter/material.dart';

class SubBox extends StatefulWidget {

  final String type;

  const SubBox({
    Key? key,
    required this.type
}) : super(key : key);

  @override
  _SubBoxState createState() => _SubBoxState();
}

class _SubBoxState extends State<SubBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: EdgeInsets.fromLTRB(9.0, 5.0, 9.0, 5.0),
      child: Text(
        widget.type,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 10.0,
          letterSpacing: 1.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
