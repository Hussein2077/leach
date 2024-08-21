import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/use_case/get_all_booking_uc.dart';

import 'event.dart';
import 'state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final CancelBookingUseCase cancelBookingUseCase;
  final GetAllBookingUseCase  getAllBookingUseCase;

  BookingBloc({  required this.cancelBookingUseCase, required this.getAllBookingUseCase})
      : super(BookingInitial()) {

    //cancel booking
    on<InitEvent> ((event, emit) => emit(BookingInitial()));
    on<CancelBookingEvent>((event, emit) async {
      emit(CancelBookingLoadingState());
      final result = await cancelBookingUseCase.call(event.bookingId);
      result.fold(
              (l) => emit(  const CancelBookingSuccessState( )),
              (r) => emit(CancelBookingErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
    // get all booking
    on<GetAllBookingEvent>((event, emit) async {
      emit(GetAllBookingLoadingState());
      final result = await getAllBookingUseCase.call(const NoParameter() );
      result.fold(
              (l) => emit(GetAllBookingSuccessState(l)),
              (r) => emit(GetAllBookingErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
