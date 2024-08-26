import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/home/domain/use_case/how_to_uc.dart';

import 'package:leach/features/home/presentation/manager/how_to/event.dart';
import 'package:leach/features/home/presentation/manager/how_to/state.dart';

class HowToBloc extends Bloc<BaseGetHowToEvent, BaseHowToState> {
  final GetHowToUseCase getHowToUseCase;

  HowToBloc({
    required this.getHowToUseCase,
  }) : super(HowToInitialState()) {
    on<GetHowToEvent>((event, emit) async {
      emit(GetHowToLoadingState());
      final result = await getHowToUseCase.call(
          GetHowToParameter(petType: event.petType, category: event.category));
      result.fold(
          (l) => emit(GetHowToSuccessState(howTo: l)),
          (r) => emit(GetHowToErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
