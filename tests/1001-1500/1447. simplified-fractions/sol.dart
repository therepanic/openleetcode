class Solution {
  List<String> simplifiedFractions(int n) {
    List<String> fractions = [];
    for (int numerator = 1; numerator < n; numerator++) {
      for (int denominator = numerator + 1; denominator <= n; denominator++) {
        if (gcd(numerator, denominator) == 1) {
          fractions.add("$numerator/$denominator");
        }
      }
    }
    return fractions;
  }
  
  int gcd(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
}
