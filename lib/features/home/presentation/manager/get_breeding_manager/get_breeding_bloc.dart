import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/home/domain/use_case/get_breeding_uc.dart';
import 'package:leach/features/home/presentation/manager/get_breeding_manager/get_breeding_event.dart';
import 'package:leach/features/home/presentation/manager/get_breeding_manager/get_breeding_state.dart';

class BreedingBloc extends Bloc<BreedingEventBase, BreedingState> {
  final GetBreedingUseCase getBreedingUseCase;
  BreedingBloc({required this.getBreedingUseCase}) : super(BreedingInitialState()) {

    on<GetBreedingEvent>((event, emit) async {
      emit(GetBreedingLoadingState());
      final result = await getBreedingUseCase.call(page: event.page, type: event.type);
      result.fold(
              (l) => emit(GetBreedingSuccessState(breedingModel: l)),
              (r) => emit(GetBreedingErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<GetMoreBreedingEvent>((event, emit) async {
      emit(GetMoreBreedingLoadingState());
      final result = await getBreedingUseCase.call(page: event.page, type: event.type);
      result.fold(
              (l) => emit(GetMoreBreedingSuccessState(breedingModel: l)),
              (r) => emit(GetMoreBreedingErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
