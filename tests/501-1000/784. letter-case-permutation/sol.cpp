class Solution {
public:
    vector<string> letterCasePermutation(string s) {
        vector<string> ans;
        function<void(int, string)> solve = [&](int idx, string curr) {
            if (idx == s.size()) {
                ans.push_back(curr);
                return;
            }
            if (isdigit(s[idx])) {
                solve(idx + 1, curr + s[idx]);
                return;
            }
            solve(idx + 1, curr + (char)tolower(s[idx]));
            solve(idx + 1, curr + (char)toupper(s[idx]));
        };
        solve(0, "");
        return ans;
    }
};
