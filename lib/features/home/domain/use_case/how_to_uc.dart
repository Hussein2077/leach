import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/utils/enums.dart';
import 'package:leach/features/home/data/models/how_toModel.dart';
import 'package:leach/features/home/domain/repo/base_repo.dart';

class GetHowToUseCase extends BaseUseCase<List<HowToModel>, GetHowToParameter> {
  final HomeBaseRepository homeBaseRepository;

  GetHowToUseCase({required this.homeBaseRepository});

  @override
  Future<Either<List<HowToModel>, Failure>> call(GetHowToParameter parameter) async {
    final result = await homeBaseRepository.getHowTo(parameter);
    return result;
  }
}

class GetHowToParameter {
  final String petType;

  final String category;

  GetHowToParameter(
      { required this.petType, required this.category});
}
