class Solution {
public:
    string reformat(string s) {
        vector<char> digits;
        vector<char> letters;
        for (char c : s) {
            if (isdigit(c)) {
                digits.push_back(c);
            } else if (isalpha(c)) {
                letters.push_back(c);
            }
        }
        if (abs((int)digits.size() - (int)letters.size()) >= 2) {
            return "";
        }
        string ans(s.length(), ' ');
        if (digits.size() > letters.size()) {
            for (int i = 0; i < s.length(); i++) {
                if (i % 2 == 0) {
                    ans[i] = digits[i / 2];
                } else {
                    ans[i] = letters[i / 2];
                }
            }
        } else {
            for (int i = 0; i < s.length(); i++) {
                if (i % 2 == 0) {
                    ans[i] = letters[i / 2];
                } else {
                    ans[i] = digits[i / 2];
                }
            }
        }
        return ans;
    }
};
