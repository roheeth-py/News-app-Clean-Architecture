import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/daily_news/domain/entities/article_entity.dart';
import 'package:myapp/features/daily_news/domain/usecases/get_article_usecase.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUsecase _getArticleUsecase;

  RemoteArticleBloc(this._getArticleUsecase)
      : super(const RemoteArticlesLoadingState()) {
    on<GetArticleEvent>(getArticleEvent);
  }
  Future<void> getArticleEvent(
      GetArticleEvent event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUsecase.call();
    print(dataState.data);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesSuccessState(dataState.data!));
    }

    if (dataState is DataError) {
      emit(RemoteArticlesErrorState(dataState.error!));
    }
  }
}
