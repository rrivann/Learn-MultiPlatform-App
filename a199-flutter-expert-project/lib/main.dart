import 'package:about/about_page.dart';
import 'package:core/core.dart';
import 'package:core/common/utils.dart';
import 'package:core/presentation/pages/tv_series/home_tv_series_page.dart';
import 'package:core/presentation/pages/movie/movie_detail_page.dart';
import 'package:core/presentation/pages/movie/home_movie_page.dart';
import 'package:core/presentation/pages/movie/popular_movies_page.dart';
import 'package:core/presentation/pages/movie/search_page.dart';
import 'package:core/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:core/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:core/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:core/presentation/pages/tv_series/search_tv_series_page.dart';
import 'package:core/presentation/pages/tv_series/top_rated_tv_series_page.dart';
import 'package:core/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:core/presentation/pages/tv_series/watlist_tv_series_page.dart';
import 'package:core/presentation/provider/movie/movie_detail_notifier.dart';
import 'package:core/presentation/provider/movie/movie_list_notifier.dart';
import 'package:core/presentation/provider/movie/movie_search_notifier.dart';
import 'package:core/presentation/provider/movie/popular_movies_notifier.dart';
import 'package:core/presentation/provider/movie/top_rated_movies_notifier.dart';
import 'package:core/presentation/provider/tv_series/popular_tv_series_notifier.dart';
import 'package:core/presentation/provider/tv_series/top_rated_tv_series_notifier.dart';
import 'package:core/presentation/provider/tv_series/tv_series_detail_notifier.dart';
import 'package:core/presentation/provider/tv_series/tv_series_list_notifier.dart';
import 'package:core/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:core/presentation/provider/tv_series/tv_series_search_notifier.dart';
import 'package:core/presentation/provider/tv_series/watchlist_tv_series_notifier.dart';
import 'package:core/presentation/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedTvSeriesNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: Material(
          child: CustomDrawer(
            content: HomeMoviePage(),
          ),
        ),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(
                  builder: (_) =>
                      Material(child: CustomDrawer(content: HomeMoviePage())));
            case PopularMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.routeName:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.routeName:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case HomeTvSeriesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => Material(
                      child: CustomDrawer(content: HomeTvSeriesPage())));
            case PopularTvSeriesPage.routeName:
              return CupertinoPageRoute(builder: (_) => PopularTvSeriesPage());
            case TopRatedTvSeriesPage.routeName:
              return CupertinoPageRoute(builder: (_) => TopRatedTvSeriesPage());
            case TvSeriesDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case SearchTvSeriesPage.routeName:
              return CupertinoPageRoute(builder: (_) => SearchTvSeriesPage());
            case WatchlistTvSeriesPage.routeName:
              return MaterialPageRoute(builder: (_) => WatchlistTvSeriesPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
