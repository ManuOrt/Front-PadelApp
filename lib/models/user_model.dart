class UserModel {
  int? id;
  String? keycloakId;
  String? name;
  String? surname;
  String? email;
  String? phoneNumber;
  String? address;
  String? username;
  DateTime? dateOfBirth;
  bool? emailVerified;
  DateTime? createDate;
  String? userImg;
  String? gender;
  String? userType;
  int? languageId;

  UserModel({
    this.id,
    this.keycloakId,
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.address,
    this.username,
    this.dateOfBirth,
    this.emailVerified,
    this.createDate,
    this.userImg,
    this.gender,
    this.userType,
    this.languageId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        keycloakId: json["keycloak_id"],
        name: json["first_name"],
        surname: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        username: json["username"],
        dateOfBirth: json["date_of_birth"] != null
            ? DateTime.parse(json["date_of_birth"])
            : null,
        emailVerified: json["email_verified"],
        createDate: json["create_date"] != null
            ? DateTime.parse(json["create_date"])
            : null,
        userImg: json["user_img"],
        gender: json["gender"],
        userType: json["user_type"],
        languageId: json["language_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "keycloak_id": keycloakId,
        "first_name": name,
        "last_name": surname,
        "email": email,
        "phone_number": phoneNumber,
        "address": address,
        "username": username,
        "date_of_birth":
            "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
        "email_verified": emailVerified,
        "create_date": createDate,
        "user_img": userImg,
        "gender": gender,
        "user_type": userType,
        "language_id": languageId,
      };

  UserModel copyWith(
      {int? id,
      String? keycloakId,
      String? name,
      String? surname,
      String? email,
      String? phoneNumber,
      String? address,
      String? username,
      DateTime? dateOfBirth,
      bool? emailVerified,
      DateTime? createDate,
      String? userImg,
      String? gender,
      String? userType,
      int? languageId}) {
    return UserModel(
      id: id ?? this.id,
      keycloakId: keycloakId ?? this.keycloakId,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      username: username ?? this.username,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      emailVerified: emailVerified ?? this.emailVerified,
      createDate: createDate ?? this.createDate,
      userImg: userImg ?? this.userImg,
      gender: gender ?? this.gender,
      userType: userType ?? this.userType,
      languageId: languageId ?? this.languageId,
    );
  }
}
