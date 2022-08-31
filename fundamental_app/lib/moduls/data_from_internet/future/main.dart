// import 'package:flutter/material.dart';

// class MainFuture extends StatelessWidget {
//   const MainFuture({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Future<bool> myTypedFuture() async {
//       await Future.delayed(const Duration(seconds: 1));
//       return Future.error('Terjadi kesalahan');
//     }

//     Future runMyFuture() async {
//       var value = await myTypedFuture().catchError((error) {
//         print(error);
//       });
//     }

//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: [
//             FlatButton(
//               child: const Text('Run Future'),
//               onPressed: () {
//                 runMyFuture();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
