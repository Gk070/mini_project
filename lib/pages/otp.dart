import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otp extends StatefulWidget{
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String otp1 = '';
  String otp2 = '';
  String otp3 = '';
  String otp4 = '';
  String otp5 = '';
  String otp = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
            ''
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/forgotPass');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Check your Email",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                letterSpacing: 1.0,
                color: Colors.indigo[800],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "We sent a reset link to ***@gmail.com enter",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.indigoAccent[100],
              ),
            ),
            Text(
              "5 digit code that mentioned in the email",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.indigoAccent[100],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        otp1 = value;
                      });
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        otp2 = value;
                      });
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        otp3 = value;
                      });
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        otp4 = value;
                      });
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        otp5 = value;
                      });
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/setPassword');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo[500],
                padding: EdgeInsets.fromLTRB(129.0, 15.0, 129.0, 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              child: Text(
                'Verify Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  "Haven't got the email yet?",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.indigoAccent[100],
                  ),
                ),
                TextButton(
                    onPressed: (){},
                    child: Text(
                      'Resend email',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.deepOrange,
                        decorationThickness: 2,
                      ),
                    ),
                )
              ],
            ),
            SizedBox(
              height: 350.0,
            ),
          ],
        ),
      ),
    );
  }
}