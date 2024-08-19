import 'package:equatable/equatable.dart';

abstract class BreedingEventBase extends Equatable {
  const BreedingEventBase();

  @override
  List<Object> get props => [];
}

class GetBreedingEvent extends BreedingEventBase {
  final String page;
  final String type;
  const GetBreedingEvent({required this.page, required this.type});
}

class GetMoreBreedingEvent extends BreedingEventBase {
  final String page;
  final String type;
  const GetMoreBreedingEvent({required this.page, required this.type});
}