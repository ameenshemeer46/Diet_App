import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/home/homeScreen.dart';
import 'package:flutter_application_1/widgets/Costombutton.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
        15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("otp screen",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),),
            SizedBox(height: 20,),
            Text("enter the otp sent to  your number +91 9876543210"),
              SizedBox(height: 20,),

            InkWell(
              onTap: (){},
              child: Text("resend otp",style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 20,),

            TextField(
             textAlign: TextAlign.center,
             keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.grey,
                hintText: "Enter OTP",
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
                FilteringTextInputFormatter.digitsOnly, 
              ],
            ),
          
            SizedBox(height: 40,),

            Costombutton(
              text: "verify",
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ));
              },
            )
             
          ],
        ),
      ),
    );
  }
}