import 'dart:io';

import 'package:myapp/core/constants/constants.dart';
import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:myapp/features/daily_news/data/model/article.dart';
import 'package:dio/dio.dart';
import 'package:myapp/features/daily_news/domain/repositories/article_repo.dart';

class ArticleRepoImpl implements ArticleRepo {
  ArticleRepoImpl(this._newsApiService);
  final NewsApiService _newsApiService;

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
          apiKey: apiKey, category: category, country: country);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(
          DioException(
              requestOptions: httpResponse.response.requestOptions,
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse),
        );
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
