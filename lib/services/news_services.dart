import 'package:dio/dio.dart';

import '../infra/apiclient.dart';
import '../models/Newsproduct.dart';
import '../pages/news.dart';

class NewsService {
  ApiClient apiclient = ApiClient();
  Future<List<Newsproduct>> getNews() async {
    Response response = await apiclient.get(
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b278c3b03b0b444289c966ca03b9d457');
    print("Response is");
    print(response.data);
    print("hello");
    // print(response.data.runtimetype);
    List<dynamic> list = response.data['articles'];
    List<Newsproduct> newsproduct =
        list.map((e) => Newsproduct.fromJSON(e)).toList();
    print(newsproduct);
    return newsproduct;
  }
}
