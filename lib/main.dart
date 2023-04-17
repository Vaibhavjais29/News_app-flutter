import 'package:flutter/material.dart';
import 'package:news_app/pages/news.dart';
import 'package:flutter/cupertino.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: News()));
}
