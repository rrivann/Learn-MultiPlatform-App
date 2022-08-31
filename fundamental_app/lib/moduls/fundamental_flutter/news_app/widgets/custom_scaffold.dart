import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/fundamental_flutter/news_app/common/navigation.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            body,
            _buildShortAppBar(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildShortAppBar(BuildContext context) {
  return Card(
    margin: const EdgeInsets.all(0),
    shape: const BeveledRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(16),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => Navigation.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            'N',
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ],
    ),
  );
}
