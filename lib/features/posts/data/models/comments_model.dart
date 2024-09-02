class CommentsModel {
  CommentsModel({
      this.success, 
      this.comments,});

  CommentsModel.fromJson(dynamic json) {
    success = json['success'];
    comments = json['comments'] != null ? Comments.fromJson(json['comments']) : null;
  }
  bool? success;
  Comments? comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (comments != null) {
      map['comments'] = comments?.toJson();
    }
    return map;
  }

}

class Comments {
  Comments({
      this.data, 
      this.pagination,});

  Comments.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CommentData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<CommentData>? data;
  Pagination? pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    return map;
  }

}

class Pagination {
  Pagination({
      this.total, 
      this.perPage, 
      this.currentPage, 
      this.lastPage,});

  Pagination.fromJson(dynamic json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['per_page'] = perPage;
    map['current_page'] = currentPage;
    map['last_page'] = lastPage;
    return map;
  }

}

class CommentData {
  CommentData({
      this.uuid, 
      this.comment, 
      this.user,});

  CommentData.fromJson(dynamic json) {
    uuid = json['uuid'];
    comment = json['comment'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? uuid;
  String? comment;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['comment'] = comment;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.uuid, 
      this.username, 
      this.profilePicture,});

  User.fromJson(dynamic json) {
    uuid = json['uuid'];
    username = json['username'];
    profilePicture = json['profile_picture'];
  }
  String? uuid;
  String? username;
  String? profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['username'] = username;
    map['profile_picture'] = profilePicture;
    return map;
  }

}