  // search use case

import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/home/data/models/search_user_model.dart';
import 'package:leach/features/home/domain/repo/base_repo.dart';

class GetSearchUserUseCase extends BaseUseCase<SearchUserResponse, SearchParam> {
  final HomeBaseRepository baseRepository;

  GetSearchUserUseCase({required this.baseRepository});

  @override
  Future<Either< SearchUserResponse, Failure>> call(SearchParam parameter) async {
    return await baseRepository.getSearchUser(  page: parameter.page , search: parameter.search  );

  }
}
// class search param
  class SearchParam {
    final String page;
    final String search;
    SearchParam({required this.page, required this.search});
  }