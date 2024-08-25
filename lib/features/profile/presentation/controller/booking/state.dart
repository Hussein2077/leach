 import 'package:equatable/equatable.dart';
import 'package:leach/features/profile/domain/model/all_booking_model.dart';

abstract class BookingState extends Equatable {
  const BookingState();
  @override
  List<Object?> get props => [];

}
class BookingInitial extends BookingState {}
 //cancel booking
 class CancelBookingLoadingState extends BookingState {}

 class CancelBookingErrorState extends BookingState {
   final String errorMessage;

     const CancelBookingErrorState({required this.errorMessage});
 }

 class CancelBookingSuccessState extends BookingState {
     const CancelBookingSuccessState();
 }
 // get all booking

 class GetAllBookingLoadingState extends BookingState {}

 class GetAllBookingErrorState extends BookingState {
   final String errorMessage;

     const GetAllBookingErrorState({required this.errorMessage});
 }

 class GetAllBookingSuccessState extends BookingState {
   final List<AllBookingModel> allBookingModel;
     const GetAllBookingSuccessState(  this.allBookingModel);
 }


