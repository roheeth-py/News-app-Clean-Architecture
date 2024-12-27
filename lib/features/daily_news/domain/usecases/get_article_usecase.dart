import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/core/usecases/usecases.dart';
import 'package:myapp/features/daily_news/domain/entities/article_entity.dart';
import 'package:myapp/features/daily_news/domain/repositories/article_repo.dart';

class GetArticleUsecase implements UseCase<DataState<List<ArticleEntity>>, void>{
  ArticleRepo articleRepo;

  GetArticleUsecase({required this.articleRepo});
  
  @override
  Future<DataState<List<ArticleEntity>>> call({void param}) {
    // TODO: implement call
    return articleRepo.getNewsArticle();
  }

}