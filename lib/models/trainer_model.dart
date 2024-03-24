import 'package:front_end_padelapp/models/user_model.dart';

class TrainerModel {
  int? id;
  UserModel? user;
  String? description;
  String? location;
  String? rangeLocation;

  TrainerModel({
    this.id,
    this.user,
    this.description,
    this.location,
    this.rangeLocation,
  });

  factory TrainerModel.fromJson(Map<String, dynamic> json) => TrainerModel(
        id: json["id"],
        user: UserModel.fromJson(json["user"]),
        description: json["description"],
        location: json["location"],
        rangeLocation: json["range_location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "description": description,
        "location": location,
        "range_location": rangeLocation,
      };
}
