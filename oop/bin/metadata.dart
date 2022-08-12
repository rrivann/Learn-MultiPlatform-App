import 'dart:ffi';

class Sample {
  @override
  String toString() {
    return "a";
  }

  @Deprecated('do not use')
  void doNotUseThis() {}
}

class Todo {
  final String todo;
  const Todo(this.todo);
}

@Todo('Will be implemeted')
class Application {
  @Todo('Will be implemeted')
  String? name;

  @Todo('Will be implemeted')
  void feature() {}
}
