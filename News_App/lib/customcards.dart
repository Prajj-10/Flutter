import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/newsapi.dart';
import 'package:intl/intl.dart';

import 'newsdetail.dart';



class VerticalListCard extends StatelessWidget{
  Articles articles;
   VerticalListCard(this.articles, {super.key});

  String urlFormatter(String url){
    String temp="";
    if(!url.toLowerCase().contains("www")){
      temp = url.split("://")[1];

    }else{
      temp= url.split("www.")[1];
    }
    String temp1 = temp.split(".")[0];

    return temp1;
  }
  String dateFormatter(String date){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime format = dateFormat.parse(date);
    DateFormat responseDate = DateFormat("MMM dd, yyyy");
    String newsDate = responseDate.format(format);
    return newsDate;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String imageURL = articles.urlToImage!;
   return GestureDetector(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(
           builder: (context)=> NewsDetail(articles: articles,)));
     },
     child: Card(
       elevation: 5,
       child: SizedBox(
         height: 120,
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
                 Container(
                   padding: const EdgeInsets.all(8.0),
                   width: size.width/1.7,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children:[
                         Text((articles.title!), style: const TextStyle(color: Colors.black,
                             fontSize: 16, fontWeight: FontWeight.bold),maxLines: 3,
                         ),
                       SizedBox(height: 10),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                             width: 100,
                             height: 30,padding: EdgeInsets.all(8.0),
                             decoration: BoxDecoration(
                               color: Colors.redAccent,
                               borderRadius: BorderRadius.circular(25),
                             ),
                             child: Center(child: Text(urlFormatter(articles.url!), style: const TextStyle(color: Colors.white),), ),
                           ),
                           Text(dateFormatter(articles.publishedAt!), style: const TextStyle(color: Colors.black,
                               fontSize: 12, fontWeight: FontWeight.bold),),

                         ],
                       ),


                         ],
                      ),
                 ),
             ],
           ),
         ),
     ),
   );
  }

}