import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS API TEST',
      theme: ThemeData(
      primarySwatch: Colors.blue,
        
    ),
      home: const MyHomePage(title: 'Home Page'),
     
    );
  }
}
