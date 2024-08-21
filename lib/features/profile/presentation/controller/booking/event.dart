abstract class BookingEvent {}

class InitEvent extends BookingEvent {}
class CancelBookingEvent extends BookingEvent {
  final int bookingId;

  CancelBookingEvent({required this.bookingId});
}
// get all booking

class GetAllBookingEvent extends BookingEvent {
  GetAllBookingEvent();
}
