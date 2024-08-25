
import 'package:equatable/equatable.dart';
import 'package:leach/core/resource_manager/enums.dart';

abstract class BaseChangePasswordEvent extends Equatable {
  const BaseChangePasswordEvent();

  @override
  List<Object> get props => [];
}
class ChangePasswordEvent extends BaseChangePasswordEvent{
  final String password ;
 final String oldPassword ;
  const ChangePasswordEvent({ required this.oldPassword,    required this.password});
}
class VerifyCodeEvent extends BaseChangePasswordEvent{
  final String email ;
  final String code ;
  const VerifyCodeEvent({  required this.email,required this.code});
}
class SendCodeEvent extends BaseChangePasswordEvent{
  final String phoneOrEmail ;
final PhoneOrEmail phoneOrEmailType ;
  const SendCodeEvent( {  required this.phoneOrEmail,this.phoneOrEmailType=PhoneOrEmail.phone,});
}