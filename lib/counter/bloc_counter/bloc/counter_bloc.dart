import 'package:bloc/bloc.dart';
import 'package:list_topic/counter/bloc_counter/bloc/counter_event.dart';
import 'package:list_topic/counter/bloc_counter/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterState(state.counter + 1));
    });
  }
}
