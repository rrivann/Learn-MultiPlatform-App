import 'package:bloc_app/cubit/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = CounterCubit();
  });

  test('Initial state shoul be counterInitial(0)', () {
    expect(counterCubit.state, CounterInitial(0));
  });
  blocTest(
    'Should emit counterInitial(1) when increment event is added',
    build: () => counterCubit,
    act: (bloc) => bloc.increment(),
    expect: () => [CounterInitial(1)],
  );
  blocTest(
    'Should emit counterInitial(-1) when decrement event is added',
    build: () => counterCubit,
    act: (bloc) => bloc.decrement(),
    expect: () => [CounterInitial(-1)],
  );
}
