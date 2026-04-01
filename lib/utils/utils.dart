import 'dart:math';

class Utils {
  // Generate a random 13-digit number
  static int generateRandomId() {
    final Random random = Random();
    // First digit should be non-zero
    int firstDigit = random.nextInt(9) + 1;

    // Generate remaining 12 digits
    String remainingDigits = '';
    for (int i = 0; i < 12; i++) {
      remainingDigits += random.nextInt(10).toString();
    }

    // Combine first digit with remaining digits
    return int.parse('$firstDigit$remainingDigits');
  }
}
