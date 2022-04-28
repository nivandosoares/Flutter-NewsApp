import 'dart:convert';
import 'package:NewsApp/model/article.dart';
import 'package:http/http.dart';

class ApiService {
  final endPointUrl = Uri.parse(
      "http://newsapi.org/v2/top-headlines?country=br&apiKey=6764c012e0d24111a71f9c0053acbfba");

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
