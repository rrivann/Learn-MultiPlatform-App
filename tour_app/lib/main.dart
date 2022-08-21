import 'package:flutter/material.dart';
import 'package:tour_app/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class Heading extends StatelessWidget {
//   final String text;
//   const Heading({Key? key, required this.text}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//     );
//   }
// }

// class BiggerText extends StatefulWidget {
//   final String text;
//   const BiggerText({Key? key, required this.text}) : super(key: key);
//   @override
//   State<BiggerText> createState() => _BiggerTextState();
// }
// class _BiggerTextState extends State<BiggerText> {
//   double _textSize = 16.0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(widget.text, style: TextStyle(fontSize: _textSize)),
//         ElevatedButton(
//           onPressed: (() => setState(() {
//                 _textSize = 32.0;
//               })),
//           child: const Text('PRESS'),
//         )
//       ],
//     );
//   }
// }

// class DropDownButton extends StatefulWidget {
//   const DropDownButton({Key? key}) : super(key: key);
//   @override
//   State<DropDownButton> createState() => _DropDownButtonState();
// }
// class _DropDownButtonState extends State<DropDownButton> {
//   String? language;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Screen'),
//       ),
//       body: DropdownButton<String>(
//         items: const <DropdownMenuItem<String>>[
//           DropdownMenuItem<String>(
//             value: 'Dart',
//             child: Text('Dart'),
//           ),
//           DropdownMenuItem<String>(
//             value: 'Kotlin',
//             child: Text('Kotlin'),
//           ),
//           DropdownMenuItem<String>(
//             value: 'Swift',
//             child: Text('Swift'),
//           ),
//         ],
//         value: language,
//         hint: const Text('Select Language'),
//         onChanged: (String? value) {
//           setState(() {
//             language = value;
//           });
//         },
//       ),
//     );
//   }
// }

// class SwitchCase extends StatefulWidget {
//   const SwitchCase({Key? key}) : super(key: key);
//   @override
//   State<SwitchCase> createState() => _SwitchCaseState();
// }
// class _SwitchCaseState extends State<SwitchCase> {
//   bool lightOn = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('First Screen'),
//         ),
//         body: Switch(
//             value: lightOn,
//             onChanged: (bool value) {
//               setState(() {
//                 lightOn = value;
//               });
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text(lightOn ? 'Light On' : 'Light Off'),
//                 duration: const Duration(seconds: 1),
//               ));
//             }));
//   }
// }

// class RadioCase extends StatefulWidget {
//   const RadioCase({Key? key}) : super(key: key);
//   @override
//   State<RadioCase> createState() => _RadioCaseState();
// }
// class _RadioCaseState extends State<RadioCase> {
//   String? language;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('First Screen'),
//         ),
//         body: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               leading: Radio<String>(
//                 value: 'Dart',
//                 groupValue: language,
//                 onChanged: (String? value) {
//                   setState(() {
//                     language = value;
//                     showSnackbar();
//                   });
//                 },
//               ),
//               title: const Text('Dart'),
//             ),
//             ListTile(
//               leading: Radio<String>(
//                 value: 'Kotlin',
//                 groupValue: language,
//                 onChanged: (String? value) {
//                   setState(() {
//                     language = value;
//                     showSnackbar();
//                   });
//                 },
//               ),
//               title: const Text('Kotlin'),
//             ),
//             ListTile(
//               leading: Radio<String>(
//                 value: 'Swift',
//                 groupValue: language,
//                 onChanged: (String? value) {
//                   setState(() {
//                     language = value;
//                     showSnackbar();
//                   });
//                 },
//               ),
//               title: const Text('Swift'),
//             )
//           ],
//         ));
//   }
//   void showSnackbar() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$language selected'),
//         duration: const Duration(seconds: 1),
//       ),
//     );
//   }
// }

// class CheckBoxCase extends StatefulWidget {
//   const CheckBoxCase({Key? key}) : super(key: key);
//   @override
//   State<CheckBoxCase> createState() => _CheckBoxCaseState();
// }
// class _CheckBoxCaseState extends State<CheckBoxCase> {
//   bool agree = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Screen'),
//       ),
//       body: ListTile(
//         leading: Checkbox(
//           value: agree,
//           onChanged: (bool? value) {
//             setState(() {
//               agree = value!;
//             });
//           },
//         ),
//         title: const Text('Agree / Disagree'),
//       ),
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   const FirstScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Screen'),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.search),
//             color: Colors.white,
//           )
//         ],
//         leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
//       ),
//       body: Container(
//         // width: 200,
//         // height: 400,
//         // color: Colors.blue,
//         padding: const EdgeInsets.all(15),
//         margin: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 80),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             // shape: BoxShape.circle,
//             boxShadow: const [
//               BoxShadow(
//                   color: Colors.black, offset: Offset(0, 3), blurRadius: 10)
//             ],
//             border: Border.all(color: Colors.green, width: 3),
//             borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             // const Text(
//             //   'Hi',
//             //   style: TextStyle(fontSize: 40),
//             // ),
//             // const Icon(Icons.share),
//             // const Icon(Icons.thumb_up),
//             // const Icon(Icons.thumb_down),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 const Icon(Icons.share),
//                 const Icon(Icons.thumb_up),
//                 const Icon(Icons.thumb_down),
//                 ElevatedButton(onPressed: () {}, child: const Text('Button')),
//                 TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Text Button',
//                       style: TextStyle(fontFamily: 'Oswald', fontSize: 30),
//                     )),
//                 OutlinedButton(
//                     onPressed: () {}, child: const Text('Outline Button')),
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.volume_up),
//                     tooltip: 'Increase volume by 10'),
//                 Image.network(
//                   'https://picsum.photos/200/300',
//                   width: 50,
//                   height: 50,
//                 ),
//                 Image.asset(
//                   'images/android.png',
//                   width: 50,
//                   height: 50,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class ScrollingScreen extends StatelessWidget {
//   const ScrollingScreen({Key? key}) : super(key: key);
//   final List<int> numberList = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//           itemCount: numberList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               height: 250,
//               decoration: BoxDecoration(
//                   color: Colors.grey, border: Border.all(color: Colors.black)),
//               child: Center(
//                 child: Text(
//                   '${numberList[index]}',
//                   style: const TextStyle(fontSize: 50),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }

// class Rainbow extends StatelessWidget {
//   const Rainbow({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//             flex: 2,
//             child: Container(
//               color: Colors.red,
//             )),
//         Expanded(
//             child: Container(
//           color: Colors.orange,
//         )),
//         Expanded(
//             child: Container(
//           color: Colors.yellow,
//         )),
//         Expanded(
//             child: Container(
//           color: Colors.green,
//         )),
//         Expanded(
//             child: Container(
//           color: Colors.blue,
//         )),
//         Expanded(
//             child: Container(
//           color: Colors.indigo,
//         )),
//         Expanded(
//             child: Container(
//           color: Colors.purple,
//         ))
//       ],
//     );
//   }
// }

// class ExpandedFlexiblePage extends StatelessWidget {
//   const ExpandedFlexiblePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Row(
//               children: const [
//                 ExpandedWidget(),
//                 FlexibleWidget(),
//               ],
//             ),
//             Row(
//               children: const [
//                 ExpandedWidget(),
//                 ExpandedWidget(),
//               ],
//             ),
//             Row(
//               children: const [
//                 FlexibleWidget(),
//                 FlexibleWidget(),
//               ],
//             ),
//             Row(
//               children: const [
//                 FlexibleWidget(),
//                 ExpandedWidget(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class ExpandedWidget extends StatelessWidget {
//   const ExpandedWidget({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.teal,
//           border: Border.all(color: Colors.white),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text(
//             'Expanded',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class FlexibleWidget extends StatelessWidget {
//   const FlexibleWidget({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.tealAccent,
//           border: Border.all(color: Colors.white),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text(
//             'Flexible',
//             style: TextStyle(
//               color: Colors.teal,
//               fontSize: 24,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   final String message = 'Hello from First Screen!';
//   const FirstScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Pindah Screen'),
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: ((context) => SecondScreen(message))));
//           },
//         ),
//       ),
//     );
//   }
// }
// class SecondScreen extends StatelessWidget {
//   final String message;
//   const SecondScreen(this.message, {Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(message),
//             OutlinedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text('back')),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body: Row(
//         children: [
//           Expanded(
//             child: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       'MediaQuery: ${screenSize.width.toStringAsFixed(2)}',
//                       style: const TextStyle(color: Colors.white, fontSize: 18),
//                       textAlign: TextAlign.center,
//                     ),
//                     Text(
//                       'LayoutBuilder: ${constraints.maxWidth}',
//                       style: const TextStyle(color: Colors.white, fontSize: 18),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//                 return Container(
//                   color: Colors.white,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Text(
//                         'MediaQuery: ${screenSize.width.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                             color: Colors.blueGrey, fontSize: 18),
//                         textAlign: TextAlign.center,
//                       ),
//                       Text(
//                         'LayoutBuilder: ${constraints.maxWidth}',
//                         style: const TextStyle(
//                             color: Colors.blueGrey, fontSize: 18),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ResponsivePage extends StatelessWidget {
//   const ResponsivePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           if (constraints.maxWidth < 600) {
//             return ListView(
//               children: _generateContainers(),
//             );
//           } else if (constraints.maxWidth < 900) {
//             return GridView.count(
//               crossAxisCount: 2,
//               children: _generateContainers(),
//             );
//           } else {
//             return GridView.count(
//               crossAxisCount: 6,
//               children: _generateContainers(),
//             );
//           }
//         },
//       ),
//     );
//   }
//   List<Widget> _generateContainers() {
//     return List<Widget>.generate(20, (index) {
//       return Container(
//         margin: const EdgeInsets.all(8),
//         color: Colors.blueGrey,
//         height: 200,
//       );
//     });
//   }
// }
