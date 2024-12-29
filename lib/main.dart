import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:myapp/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart";
import "package:myapp/features/daily_news/presentation/pages/daily_news.dart";

import "config/theme/theme.dart";
import "injection_container.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RemoteArticleBloc>()..add(const GetArticleEvent()),
      child: MaterialApp(
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
