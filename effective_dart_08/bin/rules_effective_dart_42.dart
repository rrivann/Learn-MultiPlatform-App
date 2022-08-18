// Do name types using UpperCamelCase.
// abstract class Animal {}
// abstract class Mammal extends Animal {}
// mixin Flyable {}
// class Cat extends Mammal with Walkable {}

// Dont use prefix letters.
// var instance; // good
// var mInstance;  // bad

// PREFER starting function or method comments with third-person verbs.
// Returns `true` if [username] and [password] inputs are valid.
// bool isValid(String username, String password) {}

// PREFER a noun phrase for a non-boolean property or variable.
// Good
// cat.furColor;
// calculator.firstNumber;
// list.length;
// Bad
// list.deleteItems;

// list.isEmpty
// dialog.

// DO use ?? to convert null to a boolean value.
// if(stock?.isEnough) {
//   print('Making you a cup of coffee...');
// }
// stock?.isEnough ?? false;

// AVOID using curly braces in interpolation when not needed.
// print('Hi, ${name}, You are ${thisYear - birthYear} years old.');
// print('Hi, $name, You are ${thisYear - birthYear} years old.');

// PREFER async/await over using raw futures.
// raw future
// void main() {
//   getOrder().then((value) {
//     print('You order: $value');
//   }).catchError((error) {
//     print('Sorry. $error');
//   });
//   print('Getting your order...');
// }

// // async-await
// void main() async {
//   print('Getting your order...');
//   try {
//     var order = await getOrder();
//     print('You order: $order');
//   } catch (error) {
//     print('Sorry. $error');
//   }
// }


// CONSIDER making the code read like a sentence.
// “If store is open ...”
// If (store.isOpen)
// // “hey garfield, eat!”
// garfield.eat();
// // Bad example
// // Ambigu apakah memerintahkan toko untuk tutup atau mendapatkan status dari toko
// If (store.close)


// CONSIDER using function type syntax for parameters.
// List filter(bool predicate(item)) { }
// List filter(Function predicate) { }  