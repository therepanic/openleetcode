class Solution {
public:
    int maxUniqueSplit(string s) {
        unordered_set<string> used;
        int ans = 0;
        backtrack(s, 0, used, ans);
        return ans;
    }
    
    void backtrack(const string& s, int index, unordered_set<string>& used, int& ans) {
        if (index == s.size()) {
            ans = max(ans, (int)used.size());
            return;
        }
        for (int j = index; j < s.size(); j++) {
            string curr = s.substr(index, j - index + 1);
            if (used.count(curr)) continue;
            used.insert(curr);
            backtrack(s, j + 1, used, ans);
            used.erase(curr);
        }
    }
};
