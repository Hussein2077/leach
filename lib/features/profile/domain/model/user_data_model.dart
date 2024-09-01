class UserDataModel {
  UserDataModel({
    this.success,
    this.data,
  });

  UserDataModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  bool? success;
  UserData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class UserData {
  UserData({
      this.username,
      this.name,
      this.profilePicture,
      this.bio,
      this.city,
      this.area,
      this.privateAccount,
      this.accountStatus,
      this.pets,
      this.friends,
      this.friendRequestSent,
      this.friendRequestReceived,
      this.isFriend,
      this.posts,});

  UserData.fromJson(dynamic json) {
    username = json['username'];
    name = json['name'];
    profilePicture = json['profile_picture'];
    bio = json['bio'];
    city = json['city'];
    area = json['area'];
    privateAccount = json['private_account'];
    accountStatus = json['account_status'];
    friendRequestSent = json['friend_request_sent'];
    friendRequestReceived = json['friend_request_received'];
    isFriend = json['isFriend'];
    if (json['pets'] != null) {
      pets = [];
      json['pets'].forEach((v) {
        pets?.add(Pets.fromJson(v));
      });
    }
    friends =
        json['friends'] != null ? Friends.fromJson(json['friends']) : null;
    posts = json['posts'] != null ? Posts.fromJson(json['posts']) : null;
  }

  String? username;
  String? name;
  String? profilePicture;
  String? bio;
  String? city;
  String? area;
  int? privateAccount;
  String? accountStatus;
  List<Pets>? pets;
  Friends? friends;
  Posts? posts;
  bool? friendRequestSent;
  bool? friendRequestReceived;
  bool? isFriend;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['name'] = name;
    map['profile_picture'] = profilePicture;
    map['bio'] = bio;
    map['city'] = city;
    map['area'] = area;
    map['private_account'] = privateAccount;
    map['account_status'] = accountStatus;
    map['friend_request_sent'] = friendRequestSent;
    map['friend_request_received'] = friendRequestReceived;
    map['isFriend'] = isFriend;
    if (pets != null) {
      map['pets'] = pets?.map((v) => v.toJson()).toList();
    }
    if (friends != null) {
      map['friends'] = friends?.toJson();
    }
    if (posts != null) {
      map['posts'] = posts?.toJson();
    }
    return map;
  }
}

class Friends {
  Friends({
    this.data,
    this.pagination,
  });

  Friends.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FriendsData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  List<FriendsData>? data;
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

class Posts {
  Posts({
    this.data,
    this.pagination,
  });

  Posts.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  List<Data>? data;
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
    this.lastPage,
  });

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

class Data {
  Data({
    this.id,
    this.uuid,
    this.picture,
    this.caption,
    this.commentsAllowed,
    this.liked,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    uuid = json['uuid'];
    picture = json['picture'];
    caption = json['caption'];
    commentsAllowed = json['comments_allowed'];
    liked = json['liked'];
  }
  int? id;
  String? uuid;
  String? picture;
  String? caption;
  int? commentsAllowed;
  bool? liked;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uuid'] = uuid;
    map['picture'] = picture;
    map['caption'] = caption;
    map['comments_allowed'] = commentsAllowed;
    map['liked'] = liked;
    return map;
  }
}

class FriendsData {
  FriendsData({
    this.uuid,
    this.username,
    this.profilePicture,
  });

  FriendsData.fromJson(dynamic json) {
    uuid = json['uuid'];
    username = json['username'];
    profilePicture = json['profile_picture'];
  }
  String? uuid;
  String? username;
  dynamic profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['username'] = username;
    map['profile_picture'] = profilePicture;
    return map;
  }

}

class Pets {
  Pets({
    this.id,
    this.uuid,
    this.userId,
    this.username,
    this.name,
    this.gender,
    this.petType,
    this.pureBred,
    this.breed,
    this.secondBreed,
    this.dateOfBirth,
    this.age,
    this.weight,
    this.size,
    this.breedingExperience,
    this.neuteredSpayed,
    this.profilePicture,
    this.medicalPassport,
    this.breedingAvailable,
    this.adoptionAvailable,
    this.pictures,
  });

  Pets.fromJson(dynamic json) {
    id = json['id'];
    uuid = json['uuid'];
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    gender = json['gender'];
    petType = json['pet_type'];
    pureBred = json['pure_bred'];
    breed = json['breed'];
    secondBreed = json['second_breed'];
    dateOfBirth = json['date_of_birth'];
    age = json['age'];
    weight = json['weight'];
    size = json['size'];
    breedingExperience = json['breeding_experience'];
    neuteredSpayed = json['neutered_spayed'];
    profilePicture = json['profile_picture'];
    medicalPassport = json['medical_passport'];
    breedingAvailable = json['breeding_available'];
    adoptionAvailable = json['adoption_available'];
    if (json['pictures'] != null) {
      pictures = [];
      json['pictures'].forEach((v) {
        pictures?.add(Pictures.fromJson(v));
      });
    }
  }

  int? id;
  String? uuid;
  int? userId;
  String? username;
  String? name;
  String? gender;
  String? petType;
  int? pureBred;
  String? breed;
  String? secondBreed;
  String? dateOfBirth;
  int? age;
  int? weight;
  dynamic size;
  int? breedingExperience;
  int? neuteredSpayed;
  String? profilePicture;
  String? medicalPassport;
  int? breedingAvailable;
  int? adoptionAvailable;
  List<Pictures>? pictures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uuid'] = uuid;
    map['user_id'] = userId;
    map['username'] = username;
    map['name'] = name;
    map['gender'] = gender;
    map['pet_type'] = petType;
    map['pure_bred'] = pureBred;
    map['breed'] = breed;
    map['second_breed'] = secondBreed;
    map['date_of_birth'] = dateOfBirth;
    map['age'] = age;
    map['weight'] = weight;
    map['size'] = size;
    map['breeding_experience'] = breedingExperience;
    map['neutered_spayed'] = neuteredSpayed;
    map['profile_picture'] = profilePicture;
    map['medical_passport'] = medicalPassport;
    map['breeding_available'] = breedingAvailable;
    map['adoption_available'] = adoptionAvailable;
    if (pictures != null) {
      map['pictures'] = pictures?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Pictures {
  Pictures({
    this.uuid,
    this.picture,
  });

  Pictures.fromJson(dynamic json) {
    uuid = json['uuid'];
    picture = json['picture'];
  }

  String? uuid;
  String? picture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['picture'] = picture;
    return map;
  }
}
