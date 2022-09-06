import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  sharedPreferences();
}

void sharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // set sharedPreference
  prefs.setBool('isFirstLaunch', false);

  // get sharedPreference
  // final bool preferenceValue = prefs.getBool('isFirstLaunch') ?? true;

  // delete sharedPreference
  // prefs.remove('isFirstLaunch');
}
