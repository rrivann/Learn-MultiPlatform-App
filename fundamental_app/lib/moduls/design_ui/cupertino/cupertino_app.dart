import 'package:flutter/cupertino.dart';
import 'package:fundamental_app/moduls/design_ui/cupertino/category_page.dart';

class CupertinoAppScreen extends StatelessWidget {
  const CupertinoAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return _feedsPage(context);
          case 1:
            return _searchPage(context);
          case 2:
            return _settingsPage(context);
          default:
            return const Center(
              child: Text('Page not found!'),
            );
        }
      },
    );
  }
}

Widget _feedsPage(BuildContext context) {
  Future _showFeeds(BuildContext context) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: const Text('Select Categories'),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          const CategoryPage(selectedCategory: 'Technology'),
                    ),
                  );
                },
                child: const Text('Technology'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          const CategoryPage(selectedCategory: 'Business'),
                    ),
                  );
                },
                child: const Text('Business'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          const CategoryPage(selectedCategory: 'Sport'),
                    ),
                  );
                },
                child: const Text('Sport'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          );
        });
  }

  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Cupertino App'),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Home',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
          const SizedBox(height: 8),
          CupertinoButton.filled(
            child: const Text('Select Category'),
            onPressed: () {
              _showFeeds(context);
            },
          ),
        ],
      ),
    ),
  );
}

Widget _searchPage(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Cupertino App'),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Search',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
        ],
      ),
    ),
  );
}

Widget _settingsPage(BuildContext context) {
  Future _showSettings(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Are you sure to log out?'),
          actions: [
            CupertinoDialogAction(
              child: const Text('No'),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: const Text('Yes'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Settings App'),
    ),
    child: Center(
      child: CupertinoButton(
        child: const Text('Log out'),
        onPressed: () {
          _showSettings(context);
        },
      ),
    ),
  );
}
