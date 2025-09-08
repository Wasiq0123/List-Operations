import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_topic/counter/bloc_counter/bloc/counter_bloc.dart';
import 'package:list_topic/counter/bloc_counter/bloc/counter_event.dart';
import 'package:list_topic/counter/bloc_counter/bloc/counter_state.dart';

class CounterSCreenwithBloc extends StatelessWidget {
  const CounterSCreenwithBloc({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<CounterBloc>().add(CounterIncrementEvent());
      }),
      appBar: AppBar(
        title: Text('Counter Screen with Bloc'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text('${state.counter}',
                        style: TextStyle(fontSize: 40)))
              ],
            ),
          );
        },
      ),
    );
  }
}
