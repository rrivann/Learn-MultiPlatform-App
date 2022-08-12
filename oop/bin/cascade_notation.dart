class User {
  String? username;
  String? name;
  String? email;
}

User? createUser() {
  return null;
}

void main(List<String> args) {
  var user = User()
    ..username = 'r'
    ..name = 'i'
    ..email = 'rrivan@gmail.com';

  User? user2 = createUser()
    ?..username = 'r'
    ..name = 'i'
    ..email = 'rrivan@gmail.com';

  print(user.username);
  print(user2?.name);
}
