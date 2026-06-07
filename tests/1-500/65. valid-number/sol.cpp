class Solution {
public:
    bool isNumber(string s) {
        bool seenDigit = false;
        bool seenDot = false;
        bool seenExp = false;
        bool seenDigitAfterExp = true;

        for (int i = 0; i < static_cast<int>(s.size()); ++i) {
            char c = s[i];
            if (c >= '0' && c <= '9') {
                seenDigit = true;
                seenDigitAfterExp = true;
            } else if (c == '.') {
                if (seenDot || seenExp) {
                    return false;
                }
                seenDot = true;
            } else if (c == 'e' || c == 'E') {
                if (seenExp || !seenDigit) {
                    return false;
                }
                seenExp = true;
                seenDigitAfterExp = false;
            } else if (c == '+' || c == '-') {
                if (i > 0 && s[i - 1] != 'e' && s[i - 1] != 'E') {
                    return false;
                }
            } else {
                return false;
            }
        }

        return seenDigit && seenDigitAfterExp;
    }
};
