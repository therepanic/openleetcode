class Solution {
public:
    vector<string> addOperators(string num, int target) {
        vector<string> res;
        int n = num.size();
        
        function<void(int, string, long, long)> backtrack = [&](int idx, string path, long curr, long prev) {
            if (idx == n) {
                if (curr == target) {
                    res.push_back(path);
                }
                return;
            }
            long val = 0;
            for (int i = idx; i < n; i++) {
                if (i > idx && num[idx] == '0') break;
                // Build number without stol repeatedly parsing
                val = val * 10 + (num[i] - '0');
                string s = num.substr(idx, i - idx + 1);
                if (idx == 0) {
                    backtrack(i + 1, s, val, val);
                } else {
                    backtrack(i + 1, path + "+" + s, curr + val, val);
                    backtrack(i + 1, path + "-" + s, curr - val, -val);
                    backtrack(i + 1, path + "*" + s, (curr - prev) + (prev * val), prev * val);
                }
            }
        };
        
        if (n > 0) {
            backtrack(0, "", 0, 0);
        }
        return res;
    }
};
