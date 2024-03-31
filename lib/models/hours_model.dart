class HoursModel {
  int? id;
  String? hour;

  HoursModel({
    this.id,
    this.hour,
  });

  factory HoursModel.fromJson(Map<String, dynamic> json) => HoursModel(
        id: json["id"],
        hour: json["hour"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hour": hour,
      };
}