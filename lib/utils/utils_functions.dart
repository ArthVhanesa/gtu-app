import 'dart:developer';

class Utils {
  // @TODO: Take user input for sem instead of calculating it.
  static int getSem(int admissionYear) {
    int sem = ((2022 - admissionYear) * 2) + 1;
    log("sem $sem");
    return sem;
  }
}
