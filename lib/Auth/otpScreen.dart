import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("otp screen",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),),
          SizedBox(height: 20,),
          Text("enter the otp sent to  your number +91 9876543210"),
          SizedBox(height: 20,child: 
          Row(
            children: [
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
              )
            ],
          ),
          ),
           
        ],
      ),
    );
  }
}