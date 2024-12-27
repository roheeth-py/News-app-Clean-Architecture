import 'package:myapp/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:myapp/features/daily_news/data/model/article.dart';
import 'package:retrofit/retrofit.dart';
part "news_api_service.g.dart";

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
