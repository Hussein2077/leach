
import 'package:equatable/equatable.dart';

abstract class GetUserEventBase extends Equatable {
  const GetUserEventBase();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends GetUserEventBase {
  final String id;
  const GetUserEvent({required this.id});
}