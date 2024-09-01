import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/use_case/report_user_uc.dart';
import 'package:leach/features/profile/presentation/controller/report_user/event.dart';
import 'package:leach/features/profile/presentation/controller/report_user/state.dart';


class ReportUserBloc extends Bloc<ReportUserEventBase, ReportUserState> {
  final ReportUserUseCase reportUserUseCase;

  ReportUserBloc({
    required this.reportUserUseCase,
  }) : super(const ReportUserInitialState()) {

    on<ReportUserEvent>((event, emit) async {
      emit(const ReportUserLoadingState());
      final result = await reportUserUseCase.call(event.reportParameter);
      result.fold(
              (l) => emit(ReportUserSuccessMessageState(message: l)),
              (r) => emit(ReportUserErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
