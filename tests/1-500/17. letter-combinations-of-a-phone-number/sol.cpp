class Solution {
public:
    vector<string> letterCombinations(string digits) {
        if (digits.empty()) return {};
        vector<string> map = {"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
        vector<string> res;
        string cur;
        dfs(0, digits, map, cur, res);
        return res;
    }
private:
    void dfs(int idx, const string& digits, const vector<string>& map, string& cur, vector<string>& res) {
        if (idx == (int)digits.size()) {
            res.push_back(cur);
            return;
        }
        for (char c : map[digits[idx] - '0']) {
            cur.push_back(c);
            dfs(idx + 1, digits, map, cur, res);
            cur.pop_back();
        }
    }
};
