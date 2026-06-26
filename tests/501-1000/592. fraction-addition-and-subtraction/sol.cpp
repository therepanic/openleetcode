class Solution {
private:
    int gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

public:
    string fractionAddition(string expression) {
        vector<pair<int, int>> fractions;
        int i = 0;
        while (i < expression.length()) {
            char sign;
            if (expression[i] == '+' || expression[i] == '-') {
                sign = expression[i];
                i++;
            } else {
                sign = '+';
            }
            int numerator = 0;
            while (i < expression.length() && isdigit(expression[i])) {
                numerator = numerator * 10 + (expression[i] - '0');
                i++;
            }
            i++; // skip '/'
            int denominator = 0;
            while (i < expression.length() && isdigit(expression[i])) {
                denominator = denominator * 10 + (expression[i] - '0');
                i++;
            }
            if (sign == '-') {
                numerator = -numerator;
            }
            fractions.push_back({numerator, denominator});
        }

        int commonDenominator = 1;
        for (auto& [_, den] : fractions) {
            commonDenominator *= den / gcd(commonDenominator, den);
        }

        int totalNumerator = 0;
        for (auto& [num, den] : fractions) {
            totalNumerator += num * (commonDenominator / den);
        }

        int gcdResult = gcd(abs(totalNumerator), commonDenominator);
        totalNumerator /= gcdResult;
        commonDenominator /= gcdResult;

        return to_string(totalNumerator) + "/" + to_string(commonDenominator);
    }
};
