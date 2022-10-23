import 'package:flutter/material.dart';
import 'package:grid_view/Maps.dart';
import 'package:grid_view/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20,top:50.0),
                    child: GestureDetector(onTap:() => Navigator.pop(context),
                        child: const Icon(Icons.backspace_outlined,)),
                  ),

                ],
              ),
            Row(
              children: [
                TextButton(
                    style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),

                    ), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));
                  }, child: const Text("Menu"),
                  ),
              ],
            ),

            SizedBox(
              height: size.height/1.2,
              width: size.width,
              child: Stack(
                children: [

       /* Positioned(
                bottom: size.height/3,
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,position){
                      return const DemoItem();
                    },),
                ),
              ),*/
              Positioned(
                height: size.height/1.05,
                width:  size.width,
                child: SizedBox(
                  child: GridView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) => const DemoItem(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 16/18,
                    ),

                  ),
                ),
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
class DemoItem extends StatelessWidget {
  const DemoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
        width: size.width / 3,
        height: 250,
        child: GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MapSample()));
        },
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                      Container(

                        height: 150, width: 250,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey,),
                        child: Image.asset("images/food.jpg",height: 150,width: 150,fit: BoxFit.cover,),
                      ),
                      const SizedBox(width: 8,),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("Syanko Katti Roll",style: TextStyle(fontSize: 17),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text("Double Egg Chicken Paneer"),
                      )

                ],
              ),
            ),
          ),
        )
    );
  }
}

