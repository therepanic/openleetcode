class Solution {
public:
    int maxCount(int m, int n, vector<vector<int>>& ops) {
        if (ops.empty()) {
            return m * n;
        }
        for (auto& op : ops) {
            m = min(m, op[0]);
            n = min(n, op[1]);
        }
        return m * n;
    }
};
