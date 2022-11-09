import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/newsapi.dart';

class VerticalListCard extends StatelessWidget{
  Articles articles;
   VerticalListCard(this.articles);

  @override
  Widget build(BuildContext context) {
    String imageURL = articles.urlToImage!;
   return Card(
     elevation: 5,
     child: SizedBox(
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
                   Center(
                     child: Text(articles.title!, style: const TextStyle(color: Colors.black,
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
                         child: Text(articles.url!),
                       ),
                     ],
                   ),
                   Row(
                     children:[
                         Padding(
                           padding: EdgeInsets.only(left: 10.0),
                           child: Text(articles.publishedAt!, style: const TextStyle(color: Colors.black,
                           fontSize: 16, fontWeight: FontWeight.bold),
                           ),
                         )
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