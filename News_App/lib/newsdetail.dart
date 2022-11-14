import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/newsapi.dart';


class NewsDetail extends StatefulWidget {
  const NewsDetail({Key? key, this.articles}) : super(key:key);
  final Articles? articles;
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return NewsDetailState(articles!);
  }

}
class NewsDetailState extends State<NewsDetail>{
  final Articles? articles;
  NewsDetailState(this.articles);
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
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(imageUrl: articles!.urlToImage!,
                  fit: BoxFit.cover,
                  width: size.width/1.6,
                  height: size.height/5 ,
                  errorWidget: (context, url, error)=>
                  const Icon(Icons.do_not_disturb_alt,
                    color: Colors.white,),
                  placeholder: (context,url)=>
                  const SizedBox(height:20, width: 20, child: CircularProgressIndicator()),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Icon(Icons.play_circle,
                      color: Colors.white,size:30),
                ),
              ], // Children
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(articles!.title!, style: const TextStyle(color: Colors.black,
                  fontSize: 16, fontWeight: FontWeight.bold),),
            ),
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
                  child: Center(child: Text(urlFormatter(articles!.url!), style: const TextStyle(color: Colors.white),), ),
                ),
                Text(dateFormatter(articles!.publishedAt!), style: const TextStyle(color: Colors.black,
                    fontSize: 12, fontWeight: FontWeight.bold),),

              ],
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(articles!.description!, style: const TextStyle(color: Colors.black,
              fontSize: 16, fontWeight: FontWeight.bold),),
          ),
          ],
        )


        ),
      );
  }

}
