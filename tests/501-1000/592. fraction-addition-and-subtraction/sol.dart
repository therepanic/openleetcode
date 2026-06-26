class Solution {
  int _gcd(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  String fractionAddition(String expression) {
    List<List<int>> fractions = [];
    int i = 0;
    while (i < expression.length) {
      String sign;
      if (expression[i] == '+' || expression[i] == '-') {
        sign = expression[i];
        i++;
      } else {
        sign = '+';
      }
      int numerator = 0;
      while (i < expression.length && expression[i].codeUnitAt(0) >= 48 && expression[i].codeUnitAt(0) <= 57) {
        numerator = numerator * 10 + int.parse(expression[i]);
        i++;
      }
      i++; // skip '/'
      int denominator = 0;
      while (i < expression.length && expression[i].codeUnitAt(0) >= 48 && expression[i].codeUnitAt(0) <= 57) {
        denominator = denominator * 10 + int.parse(expression[i]);
        i++;
      }
      if (sign == '-') {
        numerator = -numerator;
      }
      fractions.add([numerator, denominator]);
    }

    int commonDenominator = 1;
    for (var frac in fractions) {
      commonDenominator *= frac[1] ~/ _gcd(commonDenominator, frac[1]);
    }

    int totalNumerator = 0;
    for (var frac in fractions) {
      totalNumerator += frac[0] * (commonDenominator ~/ frac[1]);
    }

    int gcdResult = _gcd(totalNumerator.abs(), commonDenominator);
    totalNumerator ~/= gcdResult;
    commonDenominator ~/= gcdResult;

    return "$totalNumerator/$commonDenominator";
  }
}
