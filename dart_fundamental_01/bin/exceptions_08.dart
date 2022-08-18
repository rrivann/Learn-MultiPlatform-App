void main(List<String> args) {
  try {
    var a = 7;
    var b = 0;
    print(a ~/ b);
    // } on Exception {
    // print('can not divide by zero');
  } catch (e, s) {
    print('exception happened: $e');
    print('Stack trace: $s');
  } finally {
    print('this line still executed');
  }
}
