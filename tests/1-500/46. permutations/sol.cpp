class Solution {
private:
    void dfs(int i, vector<int>& nums, vector<vector<int>>& res) {
        if (i == (int)nums.size()) {
            res.push_back(nums);
            return;
        }

        for (int j = i; j < (int)nums.size(); j++) {
            swap(nums[i], nums[j]);
            dfs(i + 1, nums, res);
            swap(nums[i], nums[j]);
        }
    }

public:
    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int>> res;
        dfs(0, nums, res);
        return res;
    }
};
