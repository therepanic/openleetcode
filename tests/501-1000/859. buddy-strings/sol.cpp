class Solution {
public:
    bool buddyStrings(string s, string goal) {
        if (s.length() != goal.length()) return false;
        if (s == goal) {
            unordered_set<char> seen(s.begin(), s.end());
            return seen.size() < s.length();
        }
        vector<int> diffs;
        for (int i = 0; i < s.length(); i++) {
            if (s[i] != goal[i]) {
                diffs.push_back(i);
            }
        }
        return diffs.size() == 2 && s[diffs[0]] == goal[diffs[1]] && s[diffs[1]] == goal[diffs[0]];
    }
};
