import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kitabi/core/utils/App_Transitions.dart';
import 'package:kitabi/core/utils/service_locator.dart';
import 'package:kitabi/features/home/data/models/book_model.dart';
import 'package:kitabi/features/home/data/repos/home_repo.dart';
import 'package:kitabi/features/home/presentation/manger/smila_books_cubit/similar_books_cubit.dart';
import 'package:kitabi/features/home/presentation/views/book_details_view.dart';

import 'package:kitabi/features/home/presentation/views/home_view.dart';
import 'package:kitabi/features/search/presentation/views/search_view.dart';
import 'package:kitabi/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            AppTransitions.fade(state, const SplashView()),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) =>
            AppTransitions.slide(state, const HomeView()),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepo>(),
          )..fetchSimilarBooks(
        category: (state.extra as BookModel)
            .volumeInfo
            .categories![0],
      ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (context, state) =>
            AppTransitions.slide(state, const SearchView()),
      ),
    ],
  );
}
