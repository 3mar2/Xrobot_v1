import 'package:flutter/material.dart';
import 'package:vidioplayer/pages/category_page.dart';
import 'package:vidioplayer/pages/item_details.dart';
import 'package:vidioplayer/pages/myvidioplayer.dart';
//import 'package:vidioplayer/myvidioplayer.dart';
// import 'package:vidioplayer/pages/splash%20Screen.dart';
import 'package:vidioplayer/signup.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CatogrPage(),
      routes:{
        "video" : (ctx) => const  vidplay(),
        "Home" : (ctx) => const  Home(),
        "signup" :(ctx)=> const SignUpPage(),
        "itemdetails" :(ctx)=>  itemdetails(),

      },
    );
  }
}
