
import 'package:equatable/equatable.dart';
import 'package:leach/features/home/data/models/vendor.dart';

class AllBookingModel extends Equatable {
  final int id;
  final String user;
  final String date;
  final String time;
  final String bookingStatus;
  final Vendor vendor;

  const AllBookingModel({
    required this.id,
    required this.user,
    required this.date,
    required this.time,
    required this.bookingStatus,
    required this.vendor,
  });

  factory AllBookingModel.fromJson(Map<String, dynamic> json) {
    return AllBookingModel(
      id: json['id'],
      user: json['user'],
      date: json['date'],
      time: json['time'],
      bookingStatus: json['booking_status'],
      vendor: Vendor.fromJson(json['vendor']),
    );
  }

  @override
  List<Object?> get props => [id, user, date, time, bookingStatus, vendor];
}
