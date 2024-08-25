class FriendsModel {
  FriendsModel({
      this.success, 
      this.data,});

  FriendsModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.friends,});

  Data.fromJson(dynamic json) {
    friends = json['friends'] != null ? Friends.fromJson(json['friends']) : null;
  }
  Friends? friends;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (friends != null) {
      map['friends'] = friends?.toJson();
    }
    return map;
  }

}

class Friends {
  Friends({
      this.data, 
      this.pagination,});

  Friends.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FriendData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<FriendData>? data;
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

class FriendData {
  FriendData({
      this.id, 
      this.friendId, 
      this.friendName, 
      this.friendUsername, 
      this.friendProfilePicture, 
      this.friendUuid,
      this.status,});

  FriendData.fromJson(dynamic json) {
    id = json['id'];
    friendId = json['friend_id'];
    friendName = json['friend_name'];
    friendUsername = json['friend_username'];
    friendProfilePicture = json['friend_profile_picture'];
    friendUuid = json['friend_uuid'];
    status = json['status'];
  }
  int? id;
  int? friendId;
  String? friendName;
  String? friendUsername;
  String? friendProfilePicture;
  String? friendUuid;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['friend_id'] = friendId;
    map['friend_name'] = friendName;
    map['friend_username'] = friendUsername;
    map['friend_profile_picture'] = friendProfilePicture;
    map['friend_uuid'] = friendUuid;
    map['status'] = status;
    return map;
  }

}