class OpinionModel {
  int? id;
  int? userId;
  int? trainerId;
  String? comment;
  DateTime? date;
  int? rating;
  String? userName;
  String? userImg;
  String? surname;

  OpinionModel({
    this.id,
    this.userId,
    this.trainerId,
    this.comment,
    this.date,
    this.rating,
    this.userName,
    this.userImg,
    this.surname,
  });

  factory OpinionModel.fromJson(Map<String, dynamic> json) => OpinionModel(
        id: json["id"],
        userId: json["user_id"],
        trainerId: json["trainer_id"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        rating: json["rating"],
        userName: json["user_name"],
        userImg: json["user_img"],
        surname: json["surname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "trainer_id": trainerId,
        "comment": comment,
          "date": date?.toIso8601String(),
        "rating": rating,
        "user_name": userName,
        "user_img": userImg,
        "surname": surname,
      };
}