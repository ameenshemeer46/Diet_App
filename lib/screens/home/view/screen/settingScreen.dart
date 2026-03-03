import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/auth_provider.dart';
import 'package:flutter_application_1/screens/auth/login_screen.dart';
import 'package:flutter_application_1/widgets/OutPutField.dart';
import 'package:provider/provider.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Stack(
              children: [

               CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
              ),
                 // Edit Button
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                print("Edit tapped");
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
                child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
              ),
            ),
          ),
              ]
            ),
            SizedBox(height: 50,),
           OutPutField(text: "Name : ALEX", icon: Icons.person),
           SizedBox(height: 50,),
           OutPutField(text: "Phone : 1234567890", icon: Icons.phone),
           SizedBox(height: 100,),
           Center(
             child: TextButton(onPressed:() async {
              await context.read<AuthProvider>().signOut();
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              }
            }, child: Text("Logout",style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold,
             ),)),
           )
          ],
        ),
      ),
    );
  }
}

