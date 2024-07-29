// main_screen_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

class ChangeTabEvent extends MainScreenEvent {
  final int index;

  const ChangeTabEvent(this.index);

  @override
  List<Object> get props => [index];
}

// States
abstract class MainScreenState extends Equatable {
  const MainScreenState();
}

class MainScreenInitial extends MainScreenState {
  @override
  List<Object> get props => [];
}

class TabChangedState extends MainScreenState {
  final int selectedIndex;

  const TabChangedState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

// Bloc
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitial()) {
    on<ChangeTabEvent>((event, emit) {
      emit(TabChangedState(event.index));
    });
  }
}
