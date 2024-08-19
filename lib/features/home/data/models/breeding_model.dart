class BreedingModel {
  BreedingModel({
      this.success, 
      this.breeding,});

  BreedingModel.fromJson(dynamic json) {
    success = json['success'];
    breeding = json['breeding'] != null ? Breeding.fromJson(json['breeding']) : null;
  }
  bool? success;
  Breeding? breeding;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (breeding != null) {
      map['breeding'] = breeding?.toJson();
    }
    return map;
  }

}

class Breeding {
  Breeding({
      this.data, 
      this.pagination,});

  Breeding.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BreedingData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<BreedingData>? data;
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

class BreedingData {
  BreedingData({
      this.uuid, 
      this.userId, 
      this.username, 
      this.name, 
      this.gender, 
      this.petType, 
      this.pureBred, 
      this.breed, 
      this.secondBreed, 
      this.age, 
      this.weight, 
      this.profilePicture, 
      this.isLiked, 
      this.size,
      this.user,});

  BreedingData.fromJson(dynamic json) {
    uuid = json['uuid'];
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    gender = json['gender'];
    petType = json['pet_type'];
    pureBred = json['pure_bred'];
    breed = json['breed'];
    secondBreed = json['second_breed'];
    age = json['age'];
    weight = json['weight'];
    profilePicture = json['profile_picture'];
    isLiked = json['is_liked'];
    size = json['size']??"";
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? uuid;
  int? userId;
  String? username;
  String? name;
  String? gender;
  String? petType;
  int? pureBred;
  String? breed;
  dynamic secondBreed;
  int? age;
  dynamic weight;
  String? profilePicture;
  bool? isLiked;
  String? size;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['user_id'] = userId;
    map['username'] = username;
    map['name'] = name;
    map['gender'] = gender;
    map['pet_type'] = petType;
    map['pure_bred'] = pureBred;
    map['breed'] = breed;
    map['second_breed'] = secondBreed;
    map['age'] = age;
    map['weight'] = weight;
    map['profile_picture'] = profilePicture;
    map['is_liked'] = isLiked;
    map['size'] = size;
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