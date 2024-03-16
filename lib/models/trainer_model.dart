class TrainerModel {
  int? id;
  int? userId;
  String? description;
  String? location;
  String? rangeLocation;

  TrainerModel({
    this.id,
    this.userId,
    this.description,
    this.location,
    this.rangeLocation,
  });

  factory TrainerModel.fromJson(Map<String, dynamic> json) => TrainerModel(
        id: json["id"],
        userId: json["user_id"],
        description: json["description"],
        location: json["location"],
        rangeLocation: json["range_location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "description": description,
        "location": location,
        "range_location": rangeLocation,
      };
}
