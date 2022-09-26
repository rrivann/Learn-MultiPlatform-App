import 'package:bloc_app/cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// use stream controller
// class _MyHomePageState extends State<MyHomePage> {
//   final counterBloc = CounterBloc();
//   @override
//   void dispose() {
//     counterBloc.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: StreamBuilder(
//         stream: counterBloc.counterStream,
//         builder: (context, snapshot) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   '${snapshot.data}',
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () => counterBloc.eventSink.add(CounterEvent.decrement),
//             tooltip: 'Increment',
//             child: const Icon(Icons.remove),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           FloatingActionButton(
//             onPressed: () => counterBloc.eventSink.add(CounterEvent.increment),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }

// use flutter bloc
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: BlocBuilder<CounterBloc, CounterState>(
//         builder: (context, state) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   '${state.value}',
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () => context.read<CounterBloc>().add(Decrement()),
//             tooltip: 'Increment',
//             child: const Icon(Icons.remove),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           FloatingActionButton(
//             onPressed: () => context.read<CounterBloc>().add(Increment()),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }

// use cubit bloc
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.value}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
