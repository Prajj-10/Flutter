import 'package:flutter/cupertino.dart';

class NewsDashboard extends StatefulWidget {
  const NewsDashboard({Key? key}) : super(key: key);

  @override
  State<NewsDashboard> createState() => _NewsDashboardState();
}

class _NewsDashboardState extends State<NewsDashboard> {
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
                child: Text("Welcome to News Portal", style: TextStyle(fontSize: 30,color: Colors.black87),)),

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
