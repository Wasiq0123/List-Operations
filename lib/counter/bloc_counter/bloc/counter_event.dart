import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  List<Object?> get props => [];
}

class CounterIncrementEvent extends CounterEvent {
  // TODO: implement props
}

class ClassNameDecrementEvent extends CounterEvent {}
