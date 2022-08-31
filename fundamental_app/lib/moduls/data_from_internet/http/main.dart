import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/data_from_internet/http/album.dart';
import 'package:http/http.dart' as http;

class MainHttp extends StatefulWidget {
  const MainHttp({Key? key}) : super(key: key);

  @override
  State<MainHttp> createState() => _MainHttpState();
}

class _MainHttpState extends State<MainHttp> {
  late Future<Album> _futureAlbum;

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else {
                  return const Text('');
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
