import 'package:equatable/equatable.dart';
import 'package:leach/features/home/data/models/vendor.dart';
import 'package:leach/features/profile/domain/model/all_booking_model.dart';

abstract class BaseVendorsState extends Equatable {
  const BaseVendorsState();

  @override
  List<Object> get props => [];
}

class VendorsInitialState extends BaseVendorsState {}

class GetVendorsLoadingState extends BaseVendorsState {}

class GetVendorsErrorState extends BaseVendorsState {
  final String errorMessage;

  const GetVendorsErrorState({required this.errorMessage});
}

class GetVendorsSuccessState extends BaseVendorsState {
  final List<Vendor>  vendors;

  const GetVendorsSuccessState({required this.vendors});
}
//request booking

class RequestBookingLoadingState extends BaseVendorsState {}

class RequestBookingErrorState extends BaseVendorsState {
  final String errorMessage;

  const RequestBookingErrorState({required this.errorMessage});
}

class RequestBookingSuccessState extends BaseVendorsState {
  const RequestBookingSuccessState();
}

