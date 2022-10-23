import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget{
  const Menu({super.key});


  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }

}
class MenuState extends State<Menu>{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 370, top: 50.0),
                    child: GestureDetector(onTap:() => Navigator.pop(context),
                    child: const Icon(Icons.backspace_outlined,
                    )
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 70,
                left: 60,
                child: Text("Welcome to Foodmandu", style: TextStyle(fontSize: 30,color: Colors.black87),)),

            Positioned(
         top: 120,
          child: SizedBox(
            height: 210,
            width: size.width,
            child: ListView.builder(
              primary: true,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context,position){
                return const DemoItem();
              },),
          ),
        ),
            const Positioned(
                top: 370,
                left: 60,
                child: Text("Social Chefs Comments", style: TextStyle(fontSize: 30,color: Colors.black87),)),

            Positioned(
               top: 400,
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    itemBuilder: (context,position){
                      return const DemoItem2();
                    },),
                ),
              ),
          ],

        ),
      ),
    );
  }

}
class DemoItem extends StatelessWidget {
  const DemoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
        width: size.width/1.1,
        height: 200,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                 // height: 200, width: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey,),
                  child: Stack(
                    children: [
                      Image.asset("images/restaurant.jpg",height: 200,width: size.width/1.1,fit: BoxFit.cover,),
                      const Positioned(
                        top: 5,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0,top:160.0),
                          child: Text("Healthy Foods", style: TextStyle(fontSize: 20, color: Colors.black87),),
                        ),

                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8,),
              ],
            ),
          ),
        )
    );
  }
}
class DemoItem2 extends StatelessWidget {
  const DemoItem2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
        width: size.width/1.1,
        height: 70,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children:[
                    const Padding(
                      padding: EdgeInsets.only(left:70.0, top: 15.0),
                      child : Text("Chef ", style: TextStyle(fontSize: 20),),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left:70.0, top: 40.0),
                      child : Text("This food is healthy! Recommend 100%"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, top: 5.0),
                      child: Image.asset("images/chef.png",height: 50,width:50,fit: BoxFit.cover,),
                    ),

                  ],
                ),
                const SizedBox(width: 8,),
              ],
            ),
          ),
        )
    );
  }
}