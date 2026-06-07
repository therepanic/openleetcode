class Solution {
private:
    void dfs(int start, int target, vector<int>& candidates, vector<int>& cur, vector<vector<int>>& res) {
        if (target == 0) {
            res.push_back(cur);
            return;
        }

        for (int i = start; i < (int)candidates.size(); i++) {
            if (candidates[i] > target) break;
            cur.push_back(candidates[i]);
            dfs(i, target - candidates[i], candidates, cur, res);
            cur.pop_back();
        }
    }

public:
    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
        sort(candidates.begin(), candidates.end());
        vector<vector<int>> res;
        vector<int> cur;
        dfs(0, target, candidates, cur, res);
        return res;
    }
};
