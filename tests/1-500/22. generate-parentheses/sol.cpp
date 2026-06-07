class Solution {
public:
    vector<string> generateParenthesis(int n) {
        vector<string> res;
        string cur;
        gen(0, 0, n, cur, res);
        return res;
    }
private:
    void gen(int open, int close, int n, string& cur, vector<string>& res) {
        if (open == n && close == n) {
            res.push_back(cur);
            return;
        }
        if (open < n) {
            cur.push_back('(');
            gen(open + 1, close, n, cur, res);
            cur.pop_back();
        }
        if (close < open) {
            cur.push_back(')');
            gen(open, close + 1, n, cur, res);
            cur.pop_back();
        }
    }
};
