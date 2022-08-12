class ImmutablePoint {
  final int x;
  final int y;

  const ImmutablePoint(this.x, this.y);
}

void main(List<String> args) {
  var point = const ImmutablePoint(10, 10);
  var point2 = const ImmutablePoint(10, 10);

  print(point == point2);
}
