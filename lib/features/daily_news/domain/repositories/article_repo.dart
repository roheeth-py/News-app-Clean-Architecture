import 'package:myapp/core/resources/data_state.dart';

import '../entities/article_entity.dart';

abstract class ArticleRepo {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
