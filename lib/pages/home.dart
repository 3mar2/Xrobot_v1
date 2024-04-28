import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(centerTitle: true,title:const Text("data")  ),
      body: SafeArea(child:  Center(child: Container(width: 100,height: 100,color: Colors.blueGrey,child:const Text("daret yaseye3"),))),

    );
  }
}
