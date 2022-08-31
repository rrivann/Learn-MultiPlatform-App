import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/design_ui/practive_sliverlist_grid/academy.dart';
import 'package:fundamental_app/moduls/design_ui/practive_sliverlist_grid/silver_app_delegate.dart';

class MainPracticeSlivers extends StatelessWidget {
  const MainPracticeSlivers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dicoding Learning Path'),
        ),
        body: CustomScrollView(
          slivers: [
            _header('Android Developer'),
            SliverList(
              delegate: SliverChildListDelegate(
                androidPaths.map(_buildTile).toList(),
              ),
            ),
            _header('iOS Developer'),
            SliverGrid.count(
              crossAxisCount: 2,
              children: iosPaths.map(_buildTile).toList(),
            ),
            _header('Multi-Platform App Developer'),
            SliverGrid.count(
              crossAxisCount: 2,
              children: flutterPaths.map(_buildTile).toList(),
            ),
            _header('Front-End Web Developer'),
            SliverGrid.count(
              crossAxisCount: 2,
              children: webPaths.map(_buildTile).toList(),
            )
          ],
        ),
      ),
    );
  }
}

SliverPersistentHeader _header(String text) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: SliverAppBarDelegate(
      child: Container(
        color: Colors.lightBlue,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      minHeight: 60,
      maxHeight: 150,
    ),
  );
}

Widget _buildTile(Academy academy) {
  return ListTile(
    title: Text(academy.title),
    subtitle: Text(
      academy.description,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
    ),
  );
}
