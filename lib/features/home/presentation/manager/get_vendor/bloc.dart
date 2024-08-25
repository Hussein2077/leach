
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/home/domain/use_case/get_vendors_use_case.dart';
import 'package:leach/features/home/domain/use_case/request_booking_uc.dart';
import 'package:leach/features/home/presentation/manager/get_vendor/event.dart';
import 'package:leach/features/home/presentation/manager/get_vendor/state.dart';

class VendorsBloc extends Bloc<BaseGetVendorEvent, BaseVendorsState> {
  final GetVendorsUseCase getVendorsUseCase;
  final RequestBookingUseCase requestBookingUseCase;


  VendorsBloc({required this.getVendorsUseCase, required this.requestBookingUseCase,  })
      : super(VendorsInitialState()) {
    on<GetVendorsEvent>((event, emit) async {
      emit(GetVendorsLoadingState());
      final result = await getVendorsUseCase.call(event.type);
      result.fold(
          (l) => emit(GetVendorsSuccessState(vendors: l)),
          (r) => emit(GetVendorsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

//request booking
    on<RequestBookingEvent>((event, emit) async {
      emit(RequestBookingLoadingState());
      final result = await requestBookingUseCase.call(event.requestBooking);
      result.fold(
          (l) => emit(const RequestBookingSuccessState( )),
          (r) => emit(RequestBookingErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
