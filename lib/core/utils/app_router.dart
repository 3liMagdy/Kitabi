import 'package:go_router/go_router.dart';
import 'package:kitabi/core/utils/App_Transitions.dart';
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
        pageBuilder: (context, state) =>
            AppTransitions.slide(state, const BookDetailsView()),
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (context, state) =>
            AppTransitions.slide(state, const SearchView()),
      ),
    ],
  );
}
