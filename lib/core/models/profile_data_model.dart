class UserModel {
  String? id;
  String? email;
  String? name;
  String? phoneNumber;
  String? username;
  String? city;
  String? area;
  String? uuid;
  String? image ;
  String? bio ;
  String? accountStatus ;
  bool? privateAccount ;

  static UserModel? _instance;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.phoneNumber,
    this.username,
    this.city,
    this.area,
    this.uuid,
    this.image,
    this.bio,
    this.accountStatus,
    this.privateAccount
  });

  void clearInstance() {
    _instance = null;
  }

  setNewUserData({
    String? id,
    String? email,
    String? name,
    String? phoneNumber,
    String? username,
    String? city,
    String? area,
    String? uuid,
    String? image
    ,  String? bio ,
    String? accountStatus ,
    bool? privateAccount ,

  }) {
    this.id = id ?? this.id;
    this.email = email ?? this.email;
    this.name = name ?? this.name;
    this.phoneNumber = phoneNumber ?? this.phoneNumber;
    this.username = username ?? this.username;
    this.city = city ?? this.city;
    this.area = area ?? this.area;
    this.uuid = uuid ?? this.uuid;
    this.image = image ?? this.image;
    this.bio = bio ?? this.bio;
    this.accountStatus = accountStatus ?? this.accountStatus;
    this.privateAccount = privateAccount ?? this.privateAccount;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (_instance == null) {
      _instance = UserModel(
        id: map['id']?.toString(),
        email: map['email']??'',
        name: map['name'] ?? '',
        phoneNumber: map['phone_number']?? '',
        username: map['username']?? '',
        city: map['city']?? '',
        area: map['area']?? '',
        uuid: map['uuid']?? '',
        image: map['profile_picture']?? '',
        bio: map['bio']?? '',
        accountStatus: map['account_status']?? '',
        privateAccount: map['private_account']  ==0 ? false: true,
      );
    } else {
      _instance?.setNewUserData(
        id: map['id']?.toString(),
        email: map['email']?? '',
        name: map['name']?? '',
        phoneNumber: map['phone_number']?? '',
        username: map['username']?? '',
        city: map['city']?? '',
        area: map['area']?? '',
        uuid: map['uuid']?? '',
        image: map['profile_picture']?? '',
        bio: map['bio']?? '',
        accountStatus: map['account_status']?? '',
        privateAccount: map['private_account']==0 ? false: true,
      );
    }
    return _instance!;
  }

  static UserModel getInstance() {
    return _instance ?? UserModel();
  }
}
