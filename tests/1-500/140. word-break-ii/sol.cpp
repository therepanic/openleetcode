class Solution {
public:
    unordered_set<string> words;
    unordered_map<string, vector<string>> memo;
    vector<string> solve(const string& s) {
        if (memo.count(s)) return memo[s];
        vector<string> result;
        if (words.count(s)) result.push_back(s);
        for (int i = 1; i < static_cast<int>(s.size()); ++i) {
            string prefix = s.substr(0, i);
            if (!words.count(prefix)) continue;
            vector<string> suffixWays = solve(s.substr(i));
            for (const string& tail : suffixWays) result.push_back(prefix + " " + tail);
        }
        memo[s] = result;
        return memo[s];
    }
    vector<string> wordBreak(string s, vector<string>& wordDict) {
        words = unordered_set<string>(wordDict.begin(), wordDict.end());
        memo.clear();
        return solve(s);
    }
};
