import 'dart:convert';

// ເປັນການສະແດງຂໍ້ມູນ
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
// ເປັນການ
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  // ເປັນ ຕົວປ່ຽນພາຍໃນໃຊ້ໃນ model
  UserModel(
      {this.firstName,
      this.lastName,
      this.phone,
      this.password,
      this.profile,
      this.token});
  // ຕົວປ່ຽນພາຍນອກທີ່ສົ່ງມາ
  String? firstName;
  String? lastName;
  String? phone;
  String? password;
  String? profile;
  String? token;
// ເປັນການສ້າງ from ຂໍ້ມູນເພື່ອເອົາໄປໃສ່ງານ
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        password: json["password"],
        profile: json["profile"],
        token: json["token"],
      );
// ເປັນການສົ່ງຂໍ້ມູນກັບຄືນຫາ server
  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "password": password,
        "profile": profile,
        "token": token
      };
}

class User {
  String firstName;
  String lastName;
  String phone;
  String password;
  String profile;
  String token;
  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.profile,
    required this.token,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    String? password,
    String? profile,
    String? token,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      profile: profile ?? this.profile,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'password': password,
      'profile': profile,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
      profile: map['profile'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, phone: $phone, password: $password, profile: $profile, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone &&
        other.password == password &&
        other.profile == profile &&
        other.token == token;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        phone.hashCode ^
        password.hashCode ^
        profile.hashCode ^
        token.hashCode;
  }
}
