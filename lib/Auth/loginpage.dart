import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/otpScreen.dart';
import 'package:flutter_application_1/widgets/Costombutton.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(image: NetworkImage("https://play-lh.googleusercontent.com/yRrKkUsLS7ybmvKda75UZahg0Zgqew5xBj7ZmEQVPFopw0Vwx-n1bjLuemf9M0EIfmk=w240-h480-rw"))
            ),
            SizedBox(height: 40,),
            Center(
              child: Text("Login Page",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 20,),
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
        
        ),
        SizedBox(height: 20,),
       Costombutton(
        text: "Login",
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen() ));
        },
       )
          ],
        ),
      ),
    );
  }
}

