class Application {
  static final String name = 'rivan';
}

class Math {
  static int sum(int first, int second) => first + second;
}

void main(List<String> args) {
  print(Application.name);
  print(Math.sum(1, 2));
}
