import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart';

class NewsService {
  final String apiKey =
      '0279699a9b554d48b2839b0c9fb89d10'; // get here --> https://newsapi.org/register
  final String apiUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=business';
  int _pageNumber = 1;
  bool hasMore = true;

  Future<List<Article>> fetchArticles() async {
    final response =
        await http.get(Uri.parse('$apiUrl&apiKey=$apiKey&page=$_pageNumber'));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> articlesJson = json['articles'];
      if (articlesJson.isEmpty) {
        hasMore = false;
      }
      ++_pageNumber;
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
