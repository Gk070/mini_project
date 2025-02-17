import 'package:flutter/material.dart';

class Page3 extends StatefulWidget{
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/get1.png'),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(100.0, 0.0, 100.0, 0.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
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
              height: 60.0,
            ),
            Image.asset('images/dot3.png'),
          ],
        ),
      ),
    );
  }
}