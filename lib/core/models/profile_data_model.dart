class UserModel {
  String? id;
  String? email;
  String? name;
  String? phoneNumber;
  String? username;
  String? city;
  String? area;
  String? uuid;
  String? token;

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
    this.token,
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
    String? token,
  }) {
    this.id = id ?? this.id;
    this.email = email ?? this.email;
    this.name = name ?? this.name;
    this.phoneNumber = phoneNumber ?? this.phoneNumber;
    this.username = username ?? this.username;
    this.city = city ?? this.city;
    this.area = area ?? this.area;
    this.uuid = uuid ?? this.uuid;
    this.token = token ?? this.token;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (_instance == null) {
      _instance = UserModel(
        id: map['user']['id']?.toString(),
        email: map['user']['email'],
        name: map['user']['name'],
        phoneNumber: map['user']['phone_number'],
        username: map['user']['username'],
        city: map['user']['city'],
        area: map['user']['area'],
        uuid: map['user']['uuid'],
        token: map['user']['token'],
      );
    } else {
      _instance?.setNewUserData(
        id: map['user']['id']?.toString(),
        email: map['user']['email'],
        name: map['user']['name'],
        phoneNumber: map['user']['phone_number'],
        username: map['user']['username'],
        city: map['user']['city'],
        area: map['user']['area'],
        uuid: map['user']['uuid'],
        token: map['user']['token'],
      );
    }
    return _instance!;
  }

  static UserModel getInstance() {
    return _instance ?? UserModel();
  }
}
