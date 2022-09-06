import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/common/navigation.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/data/models/article_api_model.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/pages/article_detail_page.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/provider/database_provider.dart';
import 'package:provider/provider.dart';

class CardArticle extends StatelessWidget {
  final ArticleApi article;
  const CardArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              child: ListTile(
                onTap: () => Navigation.intentWithData(
                    ArticleDetailPage.routeName, article),
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
                trailing: isBookmarked
                    ? IconButton(
                        icon: const Icon(Icons.bookmark),
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () => provider.removeBookmark(article.url),
                      )
                    : IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () => provider.addBookmark(article),
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
