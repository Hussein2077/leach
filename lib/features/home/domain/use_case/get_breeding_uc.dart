import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';
import 'package:leach/features/home/domain/repo/base_repo.dart';

class GetBreedingUseCase {
  final HomeBaseRepository homeBaseRepository;

  GetBreedingUseCase({required this.homeBaseRepository});

  @override
  Future<Either<BreedingModel, Failure>> call({required String type, required String page}) async {
    final result = await homeBaseRepository.getBreeding(type: type, page: page);
    return result;
  }
}
