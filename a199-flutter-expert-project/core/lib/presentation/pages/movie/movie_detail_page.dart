// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:core/presentation/bloc/movie/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailPage extends StatefulWidget {
  static const routeName = '/detail';

  final int id;
  const MovieDetailPage({super.key, required this.id});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailMovieBloc>().add(FetchDetailMovies(widget.id));
      context
          .read<RecommendedMovieBloc>()
          .add(FetchRecommendedMovie(widget.id));
      context.read<WatchlistBloc>().add(LoadWatchlistStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    final resultMovieRecommended =
        context.select<RecommendedMovieBloc, List<Movie>>((value) {
      if (value.state is MovieRecomendHasData) {
        return (value.state as MovieRecomendHasData).result;
      }
      return [];
    });
    final isAddedToWatchlist = context.select<WatchlistBloc, bool>((value) {
      if (value.state is LoadWatchListHasData) {
        return (value.state as LoadWatchListHasData).isAddedToWatchlist;
      }
      return false;
    });
    return Scaffold(
      key: const Key('detail_movie'),
      body: BlocBuilder<DetailMovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieDetailHasData) {
            final movie = state.resultMovieDetail;
            return SafeArea(
              child: DetailContent(
                  movie, resultMovieRecommended, isAddedToWatchlist),
            );
          } else if (state is MovieError) {
            return SafeArea(
              child: Center(
                child: Text(state.message),
              ),
            );
          } else if (state is MovieEmpty) {
            return const SafeArea(
              child: Center(
                child: Text('No data'),
              ),
            );
          } else {
            return SafeArea(
              child: Container(),
            );
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final MovieDetail movie;
  final List<Movie> recommendations;
  final bool isAddedWatchlist;

  const DetailContent(
    this.movie,
    this.recommendations,
    this.isAddedWatchlist, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!isAddedWatchlist) {
                                  context
                                      .read<WatchlistBloc>()
                                      .add(SaveWatchlistMovie(movie));
                                } else {
                                  context
                                      .read<WatchlistBloc>()
                                      .add(RemoveWatchlistMovie(movie));
                                }

                                String message = "";

                                final state =
                                    BlocProvider.of<WatchlistBloc>(context)
                                        .state;

                                if (state is LoadWatchListHasData) {
                                  final isAdded = state.isAddedToWatchlist;
                                  message = isAdded == false
                                      ? WatchlistBloc.watchlistAddSuccessMessage
                                      : WatchlistBloc
                                          .watchlistRemoveSuccessMessage;
                                } else {
                                  message = !isAddedWatchlist
                                      ? WatchlistBloc.watchlistAddSuccessMessage
                                      : WatchlistBloc
                                          .watchlistRemoveSuccessMessage;
                                }

                                if (message ==
                                        WatchlistBloc
                                            .watchlistAddSuccessMessage ||
                                    message ==
                                        WatchlistBloc
                                            .watchlistRemoveSuccessMessage) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(message),
                                          duration: const Duration(
                                            milliseconds: 1000,
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(message),
                                        );
                                      });
                                }
                                BlocProvider.of<WatchlistBloc>(context)
                                    .add(LoadWatchlistStatus(movie.id));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(movie.genres),
                            ),
                            Text(
                              _showDuration(movie.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${movie.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              movie.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<RecommendedMovieBloc, MovieState>(
                              builder: (context, state) {
                                if (state is MovieLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is MovieError) {
                                  return Text(state.message);
                                } else if (state is MovieRecomendHasData) {
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final movie = recommendations[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                MovieDetailPage.routeName,
                                                arguments: movie.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendations.length,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }
}

String _showGenres(List<Genre> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.name}, ';
  }

  if (result.isEmpty) {
    return result;
  }

  return result.substring(0, result.length - 2);
}

String _showDuration(int runtime) {
  final int hours = runtime ~/ 60;
  final int minutes = runtime % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else {
    return '${minutes}m';
  }
}
