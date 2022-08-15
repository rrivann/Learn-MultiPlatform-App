import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('first screen'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () => {},
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              // shape: BoxShape.rectangle,
              // border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 3), blurRadius: 10)
              ]),
          width: 400,
          height: 400,
          // padding: const EdgeInsets.all(75),
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.share),
              Icon(Icons.thumb_up),
              Icon(Icons.thumb_down)
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: ((() => {})),
        child: const Icon(Icons.add),
      ),
    );
  }
}
