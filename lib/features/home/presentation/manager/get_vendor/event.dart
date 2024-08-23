import 'package:leach/core/utils/enums.dart';
import 'package:leach/features/home/data/data_source/home_remote_data_source.dart';
import 'package:leach/features/home/domain/use_case/request_booking_uc.dart';

abstract class BaseGetVendorEvent {}

class InitEvent extends BaseGetVendorEvent {}

class GetVendorsEvent extends BaseGetVendorEvent {
  final TypeOfVendor type;

  GetVendorsEvent({required this.type});
}

class RequestBookingEvent extends BaseGetVendorEvent {
  final RequestBookingParam requestBooking;

  RequestBookingEvent({required this.requestBooking});
}

