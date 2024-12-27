part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? errors;

  const RemoteArticleState({this.articles, this.errors});

  @override
  List<Object> get props => [articles!, errors!];
}

final class RemoteArticleInitial extends RemoteArticleState {}

class RemoteArticlesLoadingState extends RemoteArticleState {
  const RemoteArticlesLoadingState();
}

class RemoteArticlesSuccessState extends RemoteArticleState {
  final List<ArticleEntity> article;

  const RemoteArticlesSuccessState(this.article) : super(articles: article);
}

class RemoteArticlesErrorState extends RemoteArticleState {

  final DioException error;

  const RemoteArticlesErrorState(this.error) : super(errors: error);
}