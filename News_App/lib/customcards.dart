import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalListCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String imageURL = 'https://yt3.ggpht.com/MRywaef1JLriHf-MUivy7-WAoVAL4sB7VHZXgmprXtmpOlN73I4wBhjjWdkZNFyJNiUP6MHm1w=s900-c-k-c0x00ffffff-no-rj';
   return Card(
     elevation: 5,
     child: Container(
       height: 100,
         child: Row(

           children: [
             Column(
               children: [
                 Stack(
                   children: [
                     CachedNetworkImage(imageUrl: imageURL,
                       fit: BoxFit.cover,
                       width: 130,
                       height: 100 ,
                       errorWidget: (context, url, error)=>
                       const Icon(Icons.do_not_disturb_alt,
                         color: Colors.white,),
                       placeholder: (context,url)=>
                       const CircularProgressIndicator(),
                     ),
                     const Positioned(
                       right: 2, bottom: 2,
                       child: Icon(Icons.play_circle,
                         color: Colors.white,size: 30,),
                     ),
                   ],
                 )
               ],
             ),
             Padding(
               padding: const EdgeInsets.only(left: 60.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children:[
                   const Center(
                     child: Text("News News News", style: TextStyle(color: Colors.black,
                         fontSize: 16, fontWeight: FontWeight.bold),
                     ),
                   ),
                   Row(
                     children: [
                       Container(
                         padding: const EdgeInsets.all(12),
                         decoration: BoxDecoration(
                           color: Colors.redAccent,
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child: const Text("Read More"),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
   );
  }

}