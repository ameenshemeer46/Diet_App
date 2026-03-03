
import 'package:flutter/material.dart';

class CostomTextField extends StatelessWidget {
  const CostomTextField({
    required this.hintText,
    required this.icon,
    super.key,
  });

  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return  Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(26),
              ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
       hintStyle: TextStyle(
         color: Colors.black,
         fontSize: 16,
                ),
                 prefixIcon: Icon(
                  icon,
                  color: Colors.black,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
        ),
        
      ),
    );
  }
}
