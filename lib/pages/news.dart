import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/models/Newsproduct.dart';
import 'package:news_app/services/news_services.dart';

import '../widget/item.dart';

class News extends StatefulWidget {
  News() {}

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  NewsService service = NewsService();
  @override
  List<Newsproduct> newsproduct = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<List<Newsproduct>> future = service.getNews();
    future.then((List<Newsproduct> newsproduct) {
      this.newsproduct = newsproduct;
      setState(() {});
    }).catchError((err) => print("error is $err"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(60, 60),
          child: AppBar(
            elevation: 0,
            leading: Icon(Icons.menu),
            backgroundColor: Color.fromARGB(255, 29, 92, 240),
            centerTitle: true,
            title: Text(
              "News Feed",
              style: TextStyle(
                  //color: Color.fromARGB(255, 23, 23, 21),
                  fontSize: 25,
                  fontStyle: FontStyle.italic),
            ),
          )),
      backgroundColor: Color.fromARGB(255, 231, 240, 243),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 7, right: 7, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search for news',
                ),
              ),
            ),
            // Divider(),
            // Container(
            //   child: Image.network(
            //       'https://cdn.abplive.com/onecms/images/uploaded-images/2021/06/22/62ab798d4c40618622d49509dfc819c7_original.jpg?impolicy=abp_cdn&imwidth=720'),
            // ),
            SizedBox(
              height: 10,
            ),

            Wrap(
              children: newsproduct
                  .map((singlenews) => Item(
                      url: singlenews.imageurl,
                      //lable: singlenews.name,
                      description: singlenews.description,
                      title: singlenews.title))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
