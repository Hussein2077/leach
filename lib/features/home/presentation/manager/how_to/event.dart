import 'package:leach/core/utils/enums.dart';
import 'package:leach/features/home/data/data_source/home_remote_data_source.dart';
import 'package:leach/features/home/domain/use_case/request_booking_uc.dart';

abstract class BaseGetHowToEvent {}

class InitEvent extends BaseGetHowToEvent {}

class GetHowToEvent extends BaseGetHowToEvent {
  final TypeOfVendor  type;

  GetHowToEvent({required this.type});
}
