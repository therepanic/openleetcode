class Solution {
    private int gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    public String fractionAddition(String expression) {
        int[][] fractions = new int[expression.length()][2];
        int count = 0;
        int i = 0;
        while (i < expression.length()) {
            char sign;
            if (expression.charAt(i) == '+' || expression.charAt(i) == '-') {
                sign = expression.charAt(i);
                i++;
            } else {
                sign = '+';
            }
            int numerator = 0;
            while (i < expression.length() && Character.isDigit(expression.charAt(i))) {
                numerator = numerator * 10 + (expression.charAt(i) - '0');
                i++;
            }
            i++; // skip '/'
            int denominator = 0;
            while (i < expression.length() && Character.isDigit(expression.charAt(i))) {
                denominator = denominator * 10 + (expression.charAt(i) - '0');
                i++;
            }
            if (sign == '-') {
                numerator = -numerator;
            }
            fractions[count][0] = numerator;
            fractions[count][1] = denominator;
            count++;
        }

        int commonDenominator = 1;
        for (int j = 0; j < count; j++) {
            commonDenominator *= fractions[j][1] / gcd(commonDenominator, fractions[j][1]);
        }

        int totalNumerator = 0;
        for (int j = 0; j < count; j++) {
            totalNumerator += fractions[j][0] * (commonDenominator / fractions[j][1]);
        }

        int gcdResult = gcd(Math.abs(totalNumerator), commonDenominator);
        totalNumerator /= gcdResult;
        commonDenominator /= gcdResult;

        return totalNumerator + "/" + commonDenominator;
    }
}
