import 'package:about/about_page.dart';
import 'package:core/common/utils.dart';
import 'package:core/core.dart';
import 'package:core/presentation/bloc/movie/movie_bloc.dart';
import 'package:core/presentation/bloc/tv/tv_bloc.dart';
import 'package:core/presentation/pages/movie/movie_detail_page.dart';
import 'package:core/presentation/pages/movie/popular_movies_page.dart';
import 'package:core/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:core/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:core/presentation/pages/tv_series/home_tv_series_page.dart';
import 'package:core/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:core/presentation/pages/tv_series/top_rated_tv_series_page.dart';
import 'package:core/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:core/presentation/pages/tv_series/watlist_tv_series_page.dart';
import 'package:core/presentation/widgets/navbar.dart';
import 'package:core/utils/ssl_helper.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/movie/search_bloc.dart';
import 'package:search/presentation/bloc/tv/search_bloc.dart';
import 'package:search/presentation/pages/search_tv_series_page.dart';
import 'package:search/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SSLHelper.init();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<SearchBlocMovie>()),
        BlocProvider(create: (_) => di.locator<NowMovieBloc>()),
        BlocProvider(create: (_) => di.locator<PopularMovieBloc>()),
        BlocProvider(create: (_) => di.locator<TopMovieBloc>()),
        BlocProvider(create: (_) => di.locator<DetailMovieBloc>()),
        BlocProvider(create: (_) => di.locator<RecommendedMovieBloc>()),
        BlocProvider(create: (_) => di.locator<WatchlistBloc>()),
        BlocProvider(create: (_) => di.locator<SearchBlocTv>()),
        BlocProvider(create: (_) => di.locator<NowTvBloc>()),
        BlocProvider(create: (_) => di.locator<PopularTvBloc>()),
        BlocProvider(create: (_) => di.locator<TopTvBloc>()),
        BlocProvider(create: (_) => di.locator<DetailTvBloc>()),
        BlocProvider(create: (_) => di.locator<RecommendedTvBloc>()),
        BlocProvider(create: (_) => di.locator<WatchlistTvBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: BottomNav(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => BottomNav());
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
              return MaterialPageRoute(builder: (_) => HomeTvSeriesPage());
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
