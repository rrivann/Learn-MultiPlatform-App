String name = 'John Doe';
int age = 23;
String? favoriteFood = null;

void main() {
  String name = 'John Doe';
  int age = 23;
  String? favoriteFood = null;

  // buyAMeal(favoriteFood); // Compile error
}

void buyAMeal(String favoriteFood) {
  print('bought a $favoriteFood');
}

// void buyAMeal(String? favoriteFood) {
//   if (favoriteFood == null) {
//     print('Bought Nasi Goreng');
//   } else {
//     print('Bought $favoriteFood');
//   }
// }

// void main() {
//   String name = 'John Doe';
//   int age = 23;
//   String? favoriteFood = 'Mie Ayam';

//   buyAMeal(favoriteFood!);
// }

// void buyAMeal(String favoriteFood) {
//   print('Bought $favoriteFood');
// }
