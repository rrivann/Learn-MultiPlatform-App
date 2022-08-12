class ValidationException implements Exception {
  String message;
  ValidationException(this.message);
}

class Validation {
  static void validate(String username, String password) {
    if (username == '') {
      throw ValidationException("username blank");
    } else if (password == '') {
      throw ValidationException("password blank");
    } else if (username != "rivan" && password != "123") {
      throw Exception('login failed');
    }
  }
}

void main(List<String> args) {
  try {
    Validation.validate('a', 'a');
  } on ValidationException catch (err, stackTrace) {
    print('validation err : ${err.message}');
    print('stack : ${stackTrace.toString()}');
  } on Exception catch (err, stackTrace) {
    print('err : ${err.toString()}');
    print('stack : ${stackTrace.toString()}');
  } finally {
    print('final');
  }

  try {
    Validation.validate('a', 'a');
  } catch (err) {
    print('err : $err');
  } finally {
    print('final');
  }
  print('done');
}
