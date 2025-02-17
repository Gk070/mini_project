import 'package:flutter/material.dart';

class Page1 extends StatefulWidget{
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/get1.jpg'),
            SizedBox(
              height: 120.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(100.0, 0.0, 100.0, 0.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/page2');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.indigo[500],
                    padding: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    )
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}