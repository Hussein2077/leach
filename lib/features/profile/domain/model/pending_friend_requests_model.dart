class PendingFriendRequestsModel {
  PendingFriendRequestsModel({
      this.success, 
      this.data,});

  PendingFriendRequestsModel.fromJson(dynamic json) {
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
        data?.add(RequestData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<RequestData>? data;
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

class RequestData {
  RequestData({
      this.id, 
      this.user1Id, 
      this.user2Id, 
      this.user1Name, 
      this.user2Name, 
      this.user1Username, 
      this.user2Username, 
      this.user1ProfilePicture, 
      this.user2ProfilePicture, 
      this.status,});

  RequestData.fromJson(dynamic json) {
    id = json['id'];
    user1Id = json['user1_id'];
    user2Id = json['user2_id'];
    user1Name = json['user1_name'];
    user2Name = json['user2_name'];
    user1Username = json['user1_username'];
    user2Username = json['user2_username'];
    user1ProfilePicture = json['user1_profile_picture'];
    user2ProfilePicture = json['user2_profile_picture'];
    status = json['status'];
  }
  int? id;
  int? user1Id;
  int? user2Id;
  String? user1Name;
  String? user2Name;
  String? user1Username;
  String? user2Username;
  String? user1ProfilePicture;
  String? user2ProfilePicture;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user1_id'] = user1Id;
    map['user2_id'] = user2Id;
    map['user1_name'] = user1Name;
    map['user2_name'] = user2Name;
    map['user1_username'] = user1Username;
    map['user2_username'] = user2Username;
    map['user1_profile_picture'] = user1ProfilePicture;
    map['user2_profile_picture'] = user2ProfilePicture;
    map['status'] = status;
    return map;
  }

}