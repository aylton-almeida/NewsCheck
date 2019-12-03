//Class for input validation

abstract class Validators {
  static String require(String value) {
    if (value == null) return 'Select an option';
    if (value.isEmpty) return 'Fill this field';
    return null;
  }
}
