class UserModel {
  int? id;
  String? name;
  String? surname;
  String? email;
  String? phoneNumber;
  String? address;
  String? username;
  String? password;
  DateTime? dateOfBirth;
  bool? emailVerified;
  dynamic createDate;
  String? userImg;
  String? gender;
  String? userType;
  int? languageId;

  UserModel({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.address,
    this.username,
    this.password,
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
        name: json["first_name"],
        surname: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        username: json["username"],
        password: json["password"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        emailVerified: json["email_verified"],
        createDate: json["create_date"],
        userImg: json["user_img"],
        gender: json["gender"],
        userType: json["user_type"],
        languageId: json["language_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": name,
        "last_name": surname,
        "email": email,
        "phone_number": phoneNumber,
        "address": address,
        "username": username,
        "password": password,
        "date_of_birth":
            "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
        "email_verified": emailVerified,
        "create_date": createDate,
        "user_img": userImg,
        "gender": gender,
        "user_type": userType,
        "language_id": languageId,
      };
}
