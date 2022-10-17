import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart' as wv;

class WebView extends StatefulWidget{
  const WebView({super.key});

  @override
  State<StatefulWidget> createState() {
    return WebviewState();
  }

}
class WebviewState extends State<WebView>{
  String url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return SizedBox(
     height: size.height,
     width: size.width,
     child: const wv.WebView(
         initialUrl: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
     ),
   );
  }

}