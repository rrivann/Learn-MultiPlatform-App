// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

// class MainLocalization extends StatelessWidget {
//   const MainLocalization({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Aplikasi Localizations',
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [
//         Locale('id', ''),
//         Locale('en', ''),
//       ],
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // String _myNumberFormat1 = NumberFormat("#,###", "en_US").format(1200000);
//     // String _myNumberFormat2 =
//     //     NumberFormat.decimalPattern("en_US").format(1200000);
//     // print(myNumberFormat1); // => 1,200,000
//     // print(myNumberFormat2); // => 1,200,000

//     // String myNumberFormat =
//     //     NumberFormat.simpleCurrency(decimalDigits: 3).format(1200000);
//     // print(myNumberFormat); // => $1,200,000.000

//     // DateTime dateTime = DateTime.now();
//     // String sDateTime1 = DateFormat.yMMMEd().format(dateTime);
//     // String sDateTime2 =
//     //     DateFormat('EEE, MMM dd, yyyy', 'en_US').format(dateTime);
//     // print(sDateTime1); // => Fri, Jan 21, 2022
//     // print(sDateTime2); // => Fri, Jan 21, 2022

//     return Scaffold(
//       appBar: AppBar(
//           title: Localizations.override(
//         context: context,
//         locale: const Locale('id'),
//         child: Builder(
//           builder: (BuildContext context) {
//             return Text(AppLocalizations.of(context)!.titleApp);
//           },
//         ),
//       )),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               AppLocalizations.of(context)!.helloWorld("Dicoding"),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const Divider(color: Colors.black),
//             Text(
//               AppLocalizations.of(context)!.address("Bandung", 123),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const Divider(color: Colors.black),
//             Text(
//               AppLocalizations.of(context)!.myVar(12),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const Divider(color: Colors.black),
//             Text(
//               AppLocalizations.of(context)!.myNumber(123456),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const Divider(color: Colors.black),
//             Text(
//               AppLocalizations.of(context)!.todayDate(DateTime.now()),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const Divider(color: Colors.black),
//             Text(
//               AppLocalizations.of(context)!.myApple(1),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const Divider(color: Colors.black),
//             Text(
//               AppLocalizations.of(context)!.nThings(5, "Buku"),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
