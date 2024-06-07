import 'package:front_end_padelapp/models/models.dart';

class TrainerModel {
  int? id;
  int? userId;
  UserModel? user;
  String? title;
  String? description;
  String? location;
  String? rangeLocation;
  List<int>? categories;

  TrainerModel({
    this.id,
    this.userId,
    this.user,
    this.title,
    this.description,
    this.location,
    this.rangeLocation,
    this.categories,
  });

  factory TrainerModel.fromJson(Map<String, dynamic> json) => TrainerModel(
        id: json["id"],
        userId: json["user_id"],
        description: json["description"],
        title: json["title"],
        location: json["location"],
        rangeLocation: json["range_location"],
        categories: json["categories"] == null
            ? []
            : List<int>.from(json["categories"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "description": description,
        "title": title,
        "location": location,
        "range_location": rangeLocation,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
      };

  TrainerModel copyWith({
    int? id,
    int? userId,
    UserModel? user,
    String? title,
    String? description,
    String? location,
    String? rangeLocation,
    List<int>? categories,
  }) =>
      TrainerModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        user: user ?? this.user,
        title: title ?? this.title,
        description: description ?? this.description,
        location: location ?? this.location,
        rangeLocation: rangeLocation ?? this.rangeLocation,
        categories: categories ?? this.categories,
      );
}
