import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;

  const ArticleEntity(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.content});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [author, title, description, url, urlToImage, content];
  }
}
