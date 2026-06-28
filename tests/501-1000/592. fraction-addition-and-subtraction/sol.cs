public class Solution {
    private int Gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    public string FractionAddition(string expression) {
        var fractions = new List<(int, int)>();
        int i = 0;
        while (i < expression.Length) {
            char sign;
            if (expression[i] == '+' || expression[i] == '-') {
                sign = expression[i];
                i++;
            } else {
                sign = '+';
            }
            int numerator = 0;
            while (i < expression.Length && char.IsDigit(expression[i])) {
                numerator = numerator * 10 + (expression[i] - '0');
                i++;
            }
            i++; // skip '/'
            int denominator = 0;
            while (i < expression.Length && char.IsDigit(expression[i])) {
                denominator = denominator * 10 + (expression[i] - '0');
                i++;
            }
            if (sign == '-') {
                numerator = -numerator;
            }
            fractions.Add((numerator, denominator));
        }

        int commonDenominator = 1;
        foreach (var (_, den) in fractions) {
            commonDenominator *= den / Gcd(commonDenominator, den);
        }

        int totalNumerator = 0;
        foreach (var (num, den) in fractions) {
            totalNumerator += num * (commonDenominator / den);
        }

        int gcdResult = Gcd(Math.Abs(totalNumerator), commonDenominator);
        totalNumerator /= gcdResult;
        commonDenominator /= gcdResult;

        return $"{totalNumerator}/{commonDenominator}";
    }
}
