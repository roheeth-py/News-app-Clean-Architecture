import 'package:floor/floor.dart';

import '../../domain/entities/article_entity.dart';

@Entity(tableName: "article", primaryKeys: ['url'])
class ArticleModel extends ArticleEntity {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;

  const ArticleModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "content": content,
      };
}
