import 'package:flutter/material.dart';
import 'package:vidioplayer/wedjet/item.dart';
import '../const_model/app_colors.dart';
import '../Fakedate.dart';

class CatogrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
        centerTitle: true,
        backgroundColor: AppColors.color2,
      ),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: Category_date.map((itemdate) => itemwedgit(itemdate.id,
                  itemdate.name, itemdate.titel, itemdate.imegurl)).toList(),
            ),
          )),
    );
  }
}
