import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/data/models/article_api_model.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/article_detail_page.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/provider/news_provider.dart';
import 'package:provider/provider.dart';

// class HeadlinePage extends StatelessWidget {
//   const HeadlinePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('News App'),
//         transitionBetweenRoutes: false,
//       ),
//       child: FutureBuilder<String>(
//         future:
//             DefaultAssetBundle.of(context).loadString('assets/articles.json'),
//         builder: (context, snapshot) {
//           final List<Article> articles = parseArticles(snapshot.data);
//           return ListView.builder(
//             itemBuilder: (context, index) {
//               return _buildArticleItem(context, articles[index]);
//             },
//             itemCount: articles.length,
//           );
//         },
//       ),
//     );
//   }
// }
// Widget _buildArticleItem(BuildContext context, Article article) {
//   return Material(
//     child: InkWell(
//       onTap: () => Navigator.pushNamed(context, ArticleDetailPage.routeName,
//           arguments: article),
//       child: ListTile(
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         leading: Hero(
//           tag: article.urlToImage,
//           child: Image.network(
//             article.urlToImage,
//             width: 100,
//           ),
//         ),
//         title: Text(article.title),
//         subtitle: Text(article.author),
//       ),
//     ),
//   );
// }

class HeadlinePage extends StatelessWidget {
  const HeadlinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: Consumer<NewsProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.articlesApi.length,
              itemBuilder: (context, index) {
                var article = state.result.articlesApi[index];
                return _buildArticleItem(context, article);
              },
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        },
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, ArticleApi article) {
  return Material(
    child: InkWell(
      onTap: () => Navigator.pushNamed(context, ArticleDetailPage.routeName,
          arguments: article),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage!,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(article.title),
        subtitle: Text(article.author ?? " "),
      ),
    ),
  );
}
