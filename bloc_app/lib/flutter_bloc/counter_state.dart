// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  int value = 0;

  CounterState(this.value);

  @override
  List<Object> get props => [value];
}
