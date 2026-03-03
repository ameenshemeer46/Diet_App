import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CostomTextField.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        centerTitle: true,
        title: Text("Contacts",style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CostomTextField(hintText: "Search", icon: Icons.search),
          ],
        ),
      )
    );
  }
}