void main(List<String> args) {
  print(sum([1, 2]));
}

int sum(List<int> numbers) {
  var total = 0;
  for (var value in numbers) {
    total += value;
  }
  return total;
}
