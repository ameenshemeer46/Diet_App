import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CarousaelSlider.dart';
import 'package:flutter_application_1/widgets/ChatTile.dart';
import 'package:flutter_application_1/widgets/CostomTextField.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            carouselSlider(),
            SizedBox(height: 20,),
           
              CostomTextField(
                hintText: "Search",
                icon: Icons.search,
              ),
            
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ChatTile();
                },
              ),
            )
          ],
        ),
      )
    );
  }
}


