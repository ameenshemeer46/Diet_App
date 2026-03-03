import 'package:flutter/material.dart';


class OutPutField extends StatelessWidget {
  final String text;
  final IconData icon;
  const OutPutField({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 50,
       decoration: BoxDecoration(
         color: Colors.grey.shade300,
         borderRadius: BorderRadius.circular(26),
       ),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Row(
           children: [
            Icon(icon,color: Colors.black,),
            SizedBox(width: 10,),
            
             Text(text,style: TextStyle(
               fontSize: 16,
               color: Colors.black,
               fontWeight: FontWeight.bold,
             ),),
           ],
         ),
       ),
    );
  }
}
