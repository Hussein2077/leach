class PostsModel {
  PostsModel({
      this.success, 
      this.posts,});

  PostsModel.fromJson(dynamic json) {
    success = json['success'];
    posts = json['posts'] != null ? Posts.fromJson(json['posts']) : null;
  }
  bool? success;
  Posts? posts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (posts != null) {
      map['posts'] = posts?.toJson();
    }
    return map;
  }

}

class Posts {
  Posts({
      this.data, 
      this.pagination,});

  Posts.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PostData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<PostData>? data;
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

class PostData {
  PostData({
      this.id, 
      this.uuid, 
      this.user, 
      this.picture, 
      this.caption, 
      this.likes, 
      this.comments,});

  PostData.fromJson(dynamic json) {
    id = json['id'];
    uuid = json['uuid'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    picture = json['picture'];
    caption = json['caption'];
    if (json['likes'] != null) {
      likes = [];
      json['likes'].forEach((v) {
        likes?.add(Likes.fromJson(v));
      });
    }
    comments = json['comments'] != null ? Comments.fromJson(json['comments']) : null;
  }
  int? id;
  String? uuid;
  User? user;
  String? picture;
  String? caption;
  List<Likes>? likes;
  Comments? comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uuid'] = uuid;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['picture'] = picture;
    map['caption'] = caption;
    if (likes != null) {
      map['likes'] = likes?.map((v) => v.toJson()).toList();
    }
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

class Likes {
  Likes({
      this.uuid, 
      this.user,});

  Likes.fromJson(dynamic json) {
    uuid = json['uuid'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? uuid;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}