class Solution {
public:
    bool wordBreak(string s, vector<string>& wordDict) {
        unordered_set<string> words(wordDict.begin(), wordDict.end());
        int maxLen = 0;
        for (const string& word : wordDict) maxLen = max(maxLen, static_cast<int>(word.size()));
        vector<bool> dp(s.size() + 1, false);
        dp[s.size()] = true;
        for (int i = static_cast<int>(s.size()) - 1; i >= 0; --i) {
            for (int len = 1; len <= maxLen && i + len <= static_cast<int>(s.size()); ++len) {
                if (words.count(s.substr(i, len)) && dp[i + len]) { dp[i] = true; break; }
            }
        }
        return dp[0];
    }
};
