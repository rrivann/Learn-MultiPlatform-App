// ignore_for_file: avoid_print, unused_local_variable

import 'package:expert_app/clean_architecture/creational_pattern/model/builder_pattern.dart';
import 'package:expert_app/clean_architecture/creational_pattern/model/factory_method_pattern.dart';
import 'package:expert_app/clean_architecture/creational_pattern/model/singleton_pattern.dart';
import 'package:flutter/material.dart';

class AppCreationalPattern extends StatelessWidget {
  const AppCreationalPattern({super.key});

  @override
  Widget build(BuildContext context) {
    // singleton pattern
    final obj = SingletonObj();
    final otherObj = SingletonObj();
    print('singleton: ${obj == otherObj}');

    // builder pattern
    final geprek = AyamGeprek(type: Type.dada)
        .copyWith(notes: 'Tambah kol', sambal: Sambal.bawang, jmlCabai: 4);
    final myPhone = Handphone(TypeHandphone.nexus5);

    // factory pattern
    var platformButton = PlatformButton(Theme.of(context).platform);
    print('factory pattern: $platformButton');

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
