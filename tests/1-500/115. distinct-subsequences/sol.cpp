
class Solution {
public:
    int numDistinct(string s, string t) {
        vector<unsigned long long> dp(t.size() + 1, 0);
        dp[0] = 1;
        for (char ch : s) {
            for (int j = static_cast<int>(t.size()) - 1; j >= 0; --j) {
                if (ch == t[j]) dp[j + 1] += dp[j];
            }
        }
        return static_cast<int>(dp[t.size()]);
    }
};
