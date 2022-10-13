import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
   return Container(
     height: size.height,
     width: size.width,
     child: WebviewScaffold(
       url: url,
       hidden: true,
       appCacheEnabled: true,
       withZoom: true,



     ),
   );
  }

}