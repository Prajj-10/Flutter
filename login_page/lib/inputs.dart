import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.symmetric(vertical: 5.0),
     child: TextField(
       decoration: InputDecoration(
         contentPadding:
           const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
         filled: true,

       ),
     ),
   );
  }

}