import 'package:bloc/bloc.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/use_case/get_traits_use_case.dart';

import 'event.dart';
import 'state.dart';

class GetTraitsBloc extends Bloc<GetTraitEventBase, GetTraitsState> {
  final GetTraitsUseCase getTraitUseCase;

  GetTraitsBloc({
    required this.getTraitUseCase,
  }) : super(const GetTraitInitialState()) {
    on<InitEvent> ((event, emit) async {
      emit(const GetTraitInitialState());
    });
    on<GetTraitEvent>((event, emit) async {
      emit(const GetTraitLoadingState());
      final result = await getTraitUseCase.call(const NoParameter());
      result.fold(
              (l) => emit(GetTraitSuccessMessageState(petTraits: l)),
              (r) => emit(GetTraitErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
