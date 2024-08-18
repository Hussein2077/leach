import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class GetMyDataEventBase extends Equatable {
  const GetMyDataEventBase();

  @override
  List<Object> get props => [];
}

class GetMyDataEvent extends GetMyDataEventBase {}
class ChangePrivacyEvent extends GetMyDataEventBase {}
class UpdateMyDataEvent  extends GetMyDataEventBase {

  final String? name;
  final String? username;
  final String? bio;
  final String? city;
  final String? area;
  final File? image;
  const UpdateMyDataEvent({
      this.name,
      this.username,
      this.bio,
      this.city,
      this.image,
      this.area,
  });
}