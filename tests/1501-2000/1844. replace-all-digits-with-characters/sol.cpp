class Solution {
public:
    string replaceDigits(string s) {
        for (int i = 1; i < s.length(); i += 2) {
            char ch = s[i - 1];
            int digit = s[i] - '0';
            s[i] = ch + digit;
        }
        return s;
    }
};
