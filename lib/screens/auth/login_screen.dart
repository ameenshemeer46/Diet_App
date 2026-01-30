import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/otp_screen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  String completePhoneNumber = "";

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: NetworkImage(
                  "https://play-lh.googleusercontent.com/yRrKkUsLS7ybmvKda75UZahg0Zgqew5xBj7ZmEQVPFopw0Vwx-n1bjLuemf9M0EIfmk=w240-h480-rw",
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "Login Page",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            IntlPhoneField(
              controller: phoneController,
              initialCountryCode: 'IN',
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
              onChanged: (phone) {
                completePhoneNumber = phone.completeNumber;
              },
            ),
            const SizedBox(height: 20),
            authProvider.isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    text: "Login",
                    onTap: () async {
                      if (phoneController.text.length != 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please enter a valid 10-digit phone number",
                            ),
                          ),
                        );
                        return;
                      }

                      try {
                        await authProvider.sendOtp(completePhoneNumber);

                        // After sendOtp completes, check if we are already logged in (auto-retrieval)
                        // If logged in, main.dart will handle navigation.
                        // If not logged in, we must have a verificationId now, so navigate to OtpScreen.
                        if (mounted && !authProvider.isLoggedIn) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OtpScreen(),
                            ),
                          );
                        }
                      } catch (e) {
                        if (mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(e.toString())));
                        }
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
