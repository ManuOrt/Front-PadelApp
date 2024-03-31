import 'package:front_end_padelapp/models/availability_model.dart';

class TrainerAvailability {
  int? trainerId;
  List<AvailabilityModel>? availabilities;

  TrainerAvailability({
    this.trainerId,
    this.availabilities,
  });

factory TrainerAvailability.fromJson(List<dynamic> json) {
  return TrainerAvailability(
    trainerId: json[0]['trainer_id'],
    availabilities: json[0]['availabilities'] == null
        ? []
        : List<AvailabilityModel>.from(json[0]['availabilities'].map((x) => AvailabilityModel.fromJson(x))),
  );
}

  Map<String, dynamic> toJson() => {
        "trainer_id": trainerId,
        "availabilities": availabilities == null
            ? []
            : List<dynamic>.from(availabilities!.map((x) => x.toJson())),
      };
}
