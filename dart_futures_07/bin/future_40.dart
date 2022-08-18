void main() {
  // final myFuture = Future(() {
  //   print('Creating the future');
  //   return 12;
  // });
  // print('main() done');

  getOrder()
      .then((value) => print('You orderd: $value'))
      .catchError((error) => print('Sorry. $error'))
      .whenComplete((() => print('Thank you')));
  print('getting you order...');
}

Future<String> getOrder() {
  return Future.delayed(Duration(seconds: 3), () {
    var isStockAvailable = true;
    if (isStockAvailable) {
      return 'Coffee Boba';
    }
    //  else {
    //   throw 'Our stock is not enought';
    // }
  });
}
