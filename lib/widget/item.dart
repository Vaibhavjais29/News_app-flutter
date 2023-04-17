import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Item extends StatelessWidget {
  late String url;
  //late String lable;
  late String title;
  late String description;
  Item(
      {required this.url,
      // required this.lable,
      required this.description,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          // height: 100,
          // width: 100,
          color: Colors.grey.shade100,
          child: Image.network(url),
        ),
        Container(margin: EdgeInsets.all(5), child: Text(title)),
        // Container(
        //   margin: EdgeInsets.all(5),
        //   child: Text(lable),
        // ),
        Container(margin: EdgeInsets.all(5), child: Text(description)),
        Divider(
          thickness: 5,
        )
      ],
    ));
  }
}
