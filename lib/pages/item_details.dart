import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import '../wedjet/item.dart';

class itemdetails extends StatelessWidget {
  // final String item_id;
  // final String item_name;
  // final String item_img;
  // final String item_titel;

  // const itemdetails(  this.item_id, this.item_name,this.item_titel,this.item_img);
  @override
  Widget build(BuildContext context) {
    final routeArgument = 
    ModalRoute.of(context)!.settings.arguments as Map<String , 
    String>;

    final item_Id = routeArgument["id"].toString(); 
    final item_name = routeArgument["name"].toString();
    final item_titel = routeArgument["titel"].toString();
    final item_img = routeArgument["imgurl"].toString();
    return Scaffold(
        appBar: AppBar(
          title: Text(item_name),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  item_img,
                  fit: BoxFit.cover,
                  height: 400,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField()
              ],
            ),
          ),
        ));
  }
}
