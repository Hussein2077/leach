import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';

abstract class HomeBaseRepository {
  Future<Either<BreedingModel, Failure>> getBreeding({required String type, required String page});

}