import 'package:flutter/foundation.dart';

class UserNotes {
  final double consumedLitres;
  final double moneySpent;
  final double days;
  final double weight;
  final double height;
  final double sleep;
  final double exerciseDuration;

  UserNotes({
    @required this.consumedLitres,
    @required this.moneySpent,
    @required this.days,
    @required this.weight,
    @required this.height,
    @required this.sleep,
    @required this.exerciseDuration,
  });
}
