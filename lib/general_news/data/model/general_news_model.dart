
import 'dart:convert';

GeneralNewsModel generalNewsModelFromJson(String str) =>
    GeneralNewsModel.fromJson(json.decode(str));

String generalNewsModelToJson(GeneralNewsModel data) =>
    json.encode(data.toJson());

class GeneralNewsModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  GeneralNewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory GeneralNewsModel.fromJson(Map<String, dynamic> json) =>
      GeneralNewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? this.status,
        "totalResults": totalResults ?? this.totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Source source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

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
        "author": author ?? this.author,
        "title": title ?? this.title,
        "description": description ?? this.description,
        "url": url ?? this.url,
        "urlToImage": urlToImage ?? this.urlToImage,
        "publishedAt": publishedAt?.toIso8601String() ?? this.publishedAt,
        "content": content,
      };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? this.id,
        "name": name ?? this.name,
      };
}
