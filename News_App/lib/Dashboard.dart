
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/customcards.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String url = 'https://e3.365dm.com/22/08/768x432/skynews-breaking-news-breakingnews_5875724.jpg?20220906151704';
  String imageURL = 'https://yt3.ggpht.com/MRywaef1JLriHf-MUivy7-WAoVAL4sB7VHZXgmprXtmpOlN73I4wBhjjWdkZNFyJNiUP6MHm1w=s900-c-k-c0x00ffffff-no-rj';
  @override
    Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard",
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        elevation: 1,
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.manage_search_rounded,
                color: Colors.grey, size: 30,),

          ),
        ],


      ),
      body: Container(
        width: size.width,
        child: Column(
          children: [
            // horizontal listview
            Container(
              height: size.height/5,
              child: ListView.builder(
                primary: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index)
                  => Card(
                    elevation: 5,
                    child: Container(
                      child: Stack(
                       children: [
                         CachedNetworkImage(imageUrl: imageURL,
                           fit: BoxFit.cover,
                           width: size.width/1.6,
                           height: size.height/5 ,
                           errorWidget: (context, url, error)=>
                           const Icon(Icons.do_not_disturb_alt,
                             color: Colors.white,),
                           placeholder: (context,url)=>
                           const CircularProgressIndicator(),
                         ),
                         Positioned(
                           bottom: 5,left: 10,
                           child: Column(
                             children: const [
                               Padding(
                                 padding: EdgeInsets.only(bottom: 0.0),
                                 child: Text("Henlo Henlo",
                                   style: TextStyle(fontSize: 15,
                                       fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                                 ),
                               ),
                               Text(" Date",
                                 style: TextStyle(fontSize: 15,
                                     fontStyle: FontStyle.italic),
                               ),
                             ],
                           ),
                         ),
                         const Positioned(
                           bottom: 10,
                           right: 10,
                           child: Icon(Icons.play_circle,
                             color: Colors.white,size:30),
                         ),
                       ],

                      ),
                    ),
                  ),
              ),
            ),
            Container(
              height: size.height/1.5,
              child: ListView.builder(
                primary: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index)
                => VerticalListCard()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
