import 'package:front_end_padelapp/models/models.dart';

double calculateAverageRating(List<OpinionModel> opinions) {
  return opinions.isNotEmpty
    ? opinions.map((o) => o.rating ?? 0).reduce((a, b) => a + b) / opinions.length
    : 0.0;
}