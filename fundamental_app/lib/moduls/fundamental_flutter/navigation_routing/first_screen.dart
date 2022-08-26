import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation & Routing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/secondScreen',
                );
              },
              child: const Text(
                'Go to Second Screen',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/secondScreenWithData',
                  arguments: 'Hello from first Screen',
                );
              },
              child: const Text('Navigation with Data'),
            ),
            ElevatedButton(
              onPressed: () async {
                final scaffoldMesseger = ScaffoldMessenger.of(context);
                final result =
                    await Navigator.pushNamed(context, '/returnDataScreen');
                SnackBar snackBar = SnackBar(content: Text('$result'));
                scaffoldMesseger.showSnackBar(snackBar);
              },
              child: const Text('Return Data from Another Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/replacementScreen');
              },
              child: const Text('Replace Screen'),
            )
          ],
        ),
      ),
    );
  }
}
