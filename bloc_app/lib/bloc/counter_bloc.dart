import 'dart:async';

enum CounterEvent { increment, decrement }

class CounterBloc {
  int counter = 0;

  CounterBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  final StreamController<CounterEvent> _eventController =
      StreamController<CounterEvent>();
  final StreamController<int> _counterController = StreamController<int>();

  // for ui event
  StreamSink get eventSink => _eventController.sink;

  // for value counter
  StreamSink<int> get _counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;

  void _mapEventToState(CounterEvent event) {
    if (event == CounterEvent.increment) {
      counter++;
    } else {
      counter--;
    }

    _counterSink.add(counter);
  }

  void dispose() {
    _eventController.close();
    _counterController.close();
  }
}
