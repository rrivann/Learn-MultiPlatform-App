class Shape {
  int getCorner() => 0;
}

class Rectangle extends Shape {
  @override
  int getCorner() => 4;

  int getParentCornet() => super.getCorner();
}

void main(List<String> args) {
  var rectrangle = Rectangle();
  print(rectrangle.getCorner());
  print(rectrangle.getParentCornet());
}
