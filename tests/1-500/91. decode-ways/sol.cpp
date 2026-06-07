class Solution {
public:
    int numDecodings(string s) {
        if (s.empty() || s[0] == '0') {
            return 0;
        }

        int prev2 = 1;
        int prev1 = 1;
        for (int i = 1; i < (int)s.size(); ++i) {
            int curr = 0;
            if (s[i] != '0') {
                curr += prev1;
            }
            int value = (s[i - 1] - '0') * 10 + (s[i] - '0');
            if (10 <= value && value <= 26) {
                curr += prev2;
            }
            prev2 = prev1;
            prev1 = curr;
        }

        return prev1;
    }
};
