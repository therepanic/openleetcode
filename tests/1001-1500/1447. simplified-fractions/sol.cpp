class Solution {
public:
    vector<string> simplifiedFractions(int n) {
        vector<string> fractions;
        for (int numerator = 1; numerator < n; numerator++) {
            for (int denominator = numerator + 1; denominator <= n; denominator++) {
                if (gcd(numerator, denominator) == 1) {
                    fractions.push_back(to_string(numerator) + "/" + to_string(denominator));
                }
            }
        }
        return fractions;
    }
};
