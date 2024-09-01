
import 'package:equatable/equatable.dart';

abstract class GetSearchUserEventBase extends Equatable {
  const GetSearchUserEventBase();

  @override
  List<Object> get props => [];
}

class GetSearchUserEvent extends GetSearchUserEventBase {
  final String page;
  final String query;
  const GetSearchUserEvent(  {required this.page, required this.query});
}

class GetMoreSearchUserEvent extends GetSearchUserEventBase {
  final String page;
  final String query;
  const GetMoreSearchUserEvent({required this.page, required this.query});
}