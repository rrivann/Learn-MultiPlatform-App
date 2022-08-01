import 'dart:io';

var greetings = 'Hello Dart!'; // String
var myAge = 20;
// String greetings = 'Hello Dart!';
// int myAge = 20;

void main() {
  stdout.write('Nama Anda : ');
  String name = stdin.readLineSync()!;
  stdout.write('Usia Anda : ');
  int age = int.parse(stdin.readLineSync()!);
  print('Halo $name, usia Anda $age tahun');
}
