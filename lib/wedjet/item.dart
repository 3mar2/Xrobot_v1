// import 'dart:math';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
import 'package:vidioplayer/const_model/app_colors.dart';
// import 'package:vidioplayer/pages/item_details.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

class itemwedgit extends StatelessWidget {
  final String id; 
  final String name;
  final String title;
  final String imgurl;
  const itemwedgit(
    this.id,
    this.name,
    this.title,
    this.imgurl,
  );
  void Select_item(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("itemdetails",
    arguments: {
      "id" : id,
      "name" :name,
      "titel" :title,
      "imgurl" :imgurl
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Select_item(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        // padding:const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.buttonBackGroundColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [BoxShadow(offset: Offset.zero)]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(250),
                  child: Image.asset(
                    imgurl,
                    fit: BoxFit.cover,
                    height: 100,
                  )),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
