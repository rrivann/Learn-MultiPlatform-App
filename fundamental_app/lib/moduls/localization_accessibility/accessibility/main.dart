import 'package:flutter/material.dart';

class MainAccessibility extends StatelessWidget {
  const MainAccessibility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      home: Scaffold(
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Semantics(
                label: 'Gambar',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 150,
                  child: Image.network(
                    'https://www.99.co/blog/indonesia/wp-content/uploads/2021/12/contoh-gambar-fauna-yang-mudah.jpg',
                  ),
                ),
              ),
            ),
            MergeSemantics(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Kamu telah menekan tombol ini sebanyak:",
                  ),
                  Text(
                    '1',
                    style: Theme.of(context).textTheme.headline4,
                    semanticsLabel: "1 kali",
                  ),
                  ExcludeSemantics(
                    excluding: false,
                    child: Text(
                      '1',
                      style: Theme.of(context).textTheme.headline4,
                      semanticsLabel: "Angka 1",
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
