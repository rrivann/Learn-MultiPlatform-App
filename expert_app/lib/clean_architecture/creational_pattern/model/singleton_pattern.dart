class SingletonObj {
  static SingletonObj? _instance;

  SingletonObj._internal() {
    _instance = this;
  }

  factory SingletonObj() => _instance ?? SingletonObj._internal();
}
