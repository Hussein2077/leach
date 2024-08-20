import 'package:equatable/equatable.dart';

class Vendor extends Equatable{
  final int id;
  final String uuid;
  final String name;
  final String image;
  final String phoneNumber;
  final String category;
  final String address;
  final String baseFee;
  final double rating;
  final String description;

  const Vendor({
    required this.id,
    required this.uuid,
    required this.name,
    required this.phoneNumber,
    required this.category,
    required this.address,
    required this.baseFee,
    required this.rating,
    required this.description,
    required this.image
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      category: json['category'],
      address: json['address'],
      baseFee: json['base_fee'],
      rating: json['rating'].toDouble(),
      image: json['image']??"",
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'phone_number': phoneNumber,
      'category': category,
      'address': address,
      'base_fee': baseFee,
      'rating': rating,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [
    id,
    uuid,
    name,
    phoneNumber,
    category,
    address,
    baseFee,
    rating,
    description,
  ];
}