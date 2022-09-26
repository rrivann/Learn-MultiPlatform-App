import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(0));

  void increment() {
    emit(CounterInitial(state.value + 1));
  }

  void decrement() {
    emit(CounterInitial(state.value - 1));
  }
}
