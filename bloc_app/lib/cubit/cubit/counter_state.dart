// ignore_for_file: must_be_immutable

part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {
  int value = 0;
  CounterState(this.value);

  @override
  List<Object> get props => [value];
}

class CounterInitial extends CounterState {
  CounterInitial(super.value);
}
