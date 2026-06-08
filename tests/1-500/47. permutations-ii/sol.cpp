class Solution {
private:
    void dfs(vector<int>& nums, vector<bool>& used, vector<int>& cur, vector<vector<int>>& res) {
        if ((int)cur.size() == (int)nums.size()) {
            res.push_back(cur);
            return;
        }

        for (int i = 0; i < (int)nums.size(); i++) {
            if (used[i]) continue;
            if (i > 0 && nums[i] == nums[i - 1] && !used[i - 1]) continue;
            used[i] = true;
            cur.push_back(nums[i]);
            dfs(nums, used, cur, res);
            cur.pop_back();
            used[i] = false;
        }
    }

public:
    vector<vector<int>> permuteUnique(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        vector<vector<int>> res;
        vector<int> cur;
        vector<bool> used(nums.size(), false);
        dfs(nums, used, cur, res);
        return res;
    }
};
