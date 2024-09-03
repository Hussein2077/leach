import 'package:equatable/equatable.dart';

class SearchUser extends Equatable {
  final String uuid;
  final String username;
  final String name;
  final String? profilePicture;

  const SearchUser({
    required this.uuid,
    required this.username,
    required this.name,
    this.profilePicture,
  });

  factory SearchUser.fromJson(Map<String, dynamic> json) {
    return SearchUser(
      uuid: json['uuid'],
      username: json['username'],
      name: json['name'],
      profilePicture: json['profile_picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'username': username,
      'name': name,
      'profile_picture': profilePicture,
    };
  }

  @override
  List<Object?> get props => [uuid, username, name, profilePicture];
}

class SearchUserPagination extends Equatable {
  final int total;
  final int perPage;
  final int currentPage;
  final int lastPage;

  const SearchUserPagination({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });

  factory SearchUserPagination.fromJson(Map<String, dynamic> json) {
    return SearchUserPagination(
      total: json['total'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
      lastPage: json['last_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'per_page': perPage,
      'current_page': currentPage,
      'last_page': lastPage,
    };
  }

  @override
  List<Object> get props => [total, perPage, currentPage, lastPage];
}

class SearchUserResponse extends Equatable {
  final List<SearchUser> users;
  final SearchUserPagination pagination;

  const SearchUserResponse({
    required this.users,
    required this.pagination,
  });

  factory SearchUserResponse.fromJson(Map<String, dynamic> json) {
    return SearchUserResponse(
      users: (json['data'] as List<dynamic>)
          .map((userJson) => SearchUser.fromJson(userJson as Map<String, dynamic>))
          .toList(),
      pagination: SearchUserPagination.fromJson(json['pagination']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': users.map((user) => user.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }

  @override
  List<Object> get props => [users, pagination];
}
