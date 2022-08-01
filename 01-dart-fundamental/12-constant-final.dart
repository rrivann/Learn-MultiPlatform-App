import 'dart:io';

const pi = 3.14;
const num pi2 = 3.14;

void main() {
  var radius = 7;
  print(
      'Luas lingkaran dengan radius $radius = ${calculateCircleArea(radius)}');
}

num calculateCircleArea(num radius) => pi * radius * radius;

final firstName = stdin.readLineSync();
final lastName = stdin.readLineSync();
 
//  lastName = 'Dart'; Tidak bisa mengubah nilai
 
// print('Hello $firstName $lastName');
