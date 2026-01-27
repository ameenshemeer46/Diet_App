import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Login Page",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
          ),
      IntlPhoneField(
        initialCountryCode:'IN',
        decoration: InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        onChanged: (phone) {
          print(phone.completeNumber);
        },

      )
        ],
      ),
    );
  }
}