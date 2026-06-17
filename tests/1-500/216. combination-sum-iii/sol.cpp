#include <vector>

class Solution {
public:
    vector<vector<int>> combinationSum3(int k, int n) {
        vector<vector<int>> res;
        vector<int> path;
        backtrack(1, path, n, k, res);
        return res;
    }

private:
    void backtrack(int start, vector<int>& path, int target, int k, vector<vector<int>>& res) {
        if (target == 0 && k == 0) {
            res.push_back(path);
            return;
        }
        for (int i = start; i <= 9; ++i) {
            if (i > target || k <= 0) break;
            path.push_back(i);
            backtrack(i + 1, path, target - i, k - 1, res);
            path.pop_back();
        }
    }
};
