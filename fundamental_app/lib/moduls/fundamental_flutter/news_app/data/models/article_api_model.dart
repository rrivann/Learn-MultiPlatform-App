class ArticlesResult {
  ArticlesResult({
    required this.status,
    required this.totalResults,
    required this.articlesApi,
  });

  final String status;
  final int totalResults;
  final List<ArticleApi> articlesApi;

  factory ArticlesResult.fromJson(Map<String, dynamic> json) => ArticlesResult(
        status: json["status"],
        totalResults: json["totalResults"],
        articlesApi: List<ArticleApi>.from(
          (json["articles"] as List).map((x) => ArticleApi.fromJson(x)).where(
              (article) =>
                  article.author != null &&
                  article.urlToImage != null &&
                  article.publishedAt != null &&
                  article.content != null),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articlesApi.map((x) => x.toJson())),
      };
}

class ArticleApi {
  ArticleApi({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory ArticleApi.fromJson(Map<String, dynamic> json) => ArticleApi(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}
