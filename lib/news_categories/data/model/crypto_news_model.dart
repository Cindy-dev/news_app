// To parse this JSON data, do
//
//     final cryptoNewsModel = cryptoNewsModelFromJson(jsonString);

///
// https://newsapi.org/v2/everything?q=health&apiKey=76666343a8b643979f037b74a2c804b4
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=76666343a8b643979f037b74a2c804b4
import 'dart:convert';

CryptoNewsModel cryptoNewsModelFromJson(String str) => CryptoNewsModel.fromJson(json.decode(str));

String cryptoNewsModelToJson(CryptoNewsModel data) => json.encode(data.toJson());

class CryptoNewsModel {
  String status;
  int totalResults;
  List<Article> articles;

  CryptoNewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory CryptoNewsModel.fromJson(Map<String, dynamic> json) => CryptoNewsModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Source source;
  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  Id? id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: idValues.map[json["id"]]!,
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "name": name,
  };
}

enum Id { ENGADGET, GOOGLE_NEWS, THE_VERGE, BUSINESS_INSIDER, WIRED, BBC_NEWS, ABC_NEWS }

final idValues = EnumValues({
  "abc-news": Id.ABC_NEWS,
  "bbc-news": Id.BBC_NEWS,
  "business-insider": Id.BUSINESS_INSIDER,
  "engadget": Id.ENGADGET,
  "google-news": Id.GOOGLE_NEWS,
  "the-verge": Id.THE_VERGE,
  "wired": Id.WIRED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
