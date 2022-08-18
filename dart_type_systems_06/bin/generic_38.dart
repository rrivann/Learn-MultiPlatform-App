void main(List<String> args) {
  // List<int> numberList = [1, 2, 3, 4, 5];
  // List<String> stringList = ['Dart', 'Flutter', 'Android', 'iOS'];
  // List dynamicList = [1, 2, 3, 'empat']; // List<dynamic>
}

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}
