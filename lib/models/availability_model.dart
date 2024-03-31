import 'package:front_end_padelapp/models/hours_model.dart';

class AvailabilityModel {
  String? day;
  double? morningPrice;
  double? eveningPrice;
  List<HoursModel>? hours;


  AvailabilityModel({
    this.day,
    this.morningPrice,
    this.eveningPrice,
    this.hours,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) => AvailabilityModel(
        day: json["day"],
        morningPrice: json["morning_price"],
        eveningPrice: json["evening_price"],
        hours: json["hours"] == null
            ? []
            : List<HoursModel>.from(json["hours"].map((x) => HoursModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "morning_price": morningPrice,
        "evening_price": eveningPrice,
        "hours": hours == null
            ? []
            : List<dynamic>.from(hours!.map((x) => x.toJson())),
      };
}
