import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/utils/enums.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';
import 'package:leach/features/home/data/models/vendor.dart';
import 'package:leach/features/home/domain/repo/base_repo.dart';

class  GetVendorsUseCase extends BaseUseCase<List<Vendor>,  TypeOfVendor>{
  final HomeBaseRepository homeBaseRepository;

  GetVendorsUseCase({required this.homeBaseRepository});

  @override
  Future<Either<List<Vendor>, Failure>> call(TypeOfVendor parameter ) async {
    final result = await homeBaseRepository.getVendors(parameter );
    return result;
  }
}
