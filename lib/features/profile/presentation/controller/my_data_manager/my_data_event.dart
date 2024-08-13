import 'package:equatable/equatable.dart';

abstract class GetMyDataEventBase extends Equatable {
  const GetMyDataEventBase();

  @override
  List<Object> get props => [];
}

class GetMyDataEvent extends GetMyDataEventBase {}