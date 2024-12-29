import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import 'package:myapp/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Daily News"),
    );
  }

  Widget _body() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
      if (state is RemoteArticlesLoadingState) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }

      if (state is RemoteArticlesErrorState) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }

      if (state is RemoteArticlesSuccessState) {
        return ListView.builder(
            itemCount: 20,
            itemBuilder: (ctx, item) {
              return ArticleTile(article: state.article[item]);
            });
      }

      return const SizedBox();
    });
  }
}
