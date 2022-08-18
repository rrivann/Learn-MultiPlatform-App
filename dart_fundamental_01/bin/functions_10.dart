void main(List<String> args) {
  greet('rivan', 2001);
  average(7, 10);
  greetNewUser('rivan', 21);
  greetNewUser2(age: 21, name: 'riv');
}

void greet(String name, int bornYear) {
  var age = 2022 - bornYear;
  print('Halo $name! Tahun ini Anda berusia $age tahun');
}

double average(num num1, num num2) => (num1 + num2) / 2;
void greetNewUser(String? name, int? age, [bool? isVerified]) => print('a');
void greetNewUser2({required String? name, int? age, bool? isVerified}) =>
    print('a');
