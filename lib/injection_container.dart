import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/core/usecases/usecases.dart';
import 'package:myapp/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:myapp/features/daily_news/data/repositories/article_repo_impl.dart';
import 'package:myapp/features/daily_news/domain/repositories/article_repo.dart';
import 'package:myapp/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:myapp/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepo>(ArticleRepoImpl(sl()));
  sl.registerSingleton<UseCase>(GetArticleUsecase(articleRepo: sl()));

  sl.registerFactory<RemoteArticleBloc>(
    () {
      return RemoteArticleBloc(sl());
    },
  );
}
