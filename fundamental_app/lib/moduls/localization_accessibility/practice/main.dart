import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/localization_accessibility/practice/common.dart';
import 'package:fundamental_app/moduls/localization_accessibility/practice/home.dart';
import 'package:fundamental_app/moduls/localization_accessibility/practice/localizations_provider.dart';
import 'package:provider/provider.dart';

class MainPracticeLocalization extends StatelessWidget {
  const MainPracticeLocalization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocalizationProvider(),
        builder: (context, child) {
          final locale = Provider.of<LocalizationProvider>(context).locale;
          return MaterialApp(
            showSemanticsDebugger: false,
            locale: locale,
            title: 'Flutter Localization & Accessibility',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              scaffoldBackgroundColor: Colors.grey.shade50,
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey.shade800,
                  onPrimary: Colors.white,
                ),
              ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const HomePageLocalization(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
