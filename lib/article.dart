class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  Article(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ??
          'https://u2.9111s.ru/uploads/202302/27/b9ca5c0fcd4b42794c0f9a3f04ebac89.png',
    );
  }
}
