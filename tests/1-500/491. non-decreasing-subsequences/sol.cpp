class Solution {
public:
    vector<vector<int>> findSubsequences(vector<int>& nums) {
        set<vector<int>> result;
        vector<int> path;
        backtrack(0, path, nums, result);
        return vector<vector<int>>(result.begin(), result.end());
    }
    
private:
    void backtrack(int index, vector<int>& path, vector<int>& nums, set<vector<int>>& result) {
        if (path.size() >= 2) {
            result.insert(path);
        }
        for (int i = index; i < nums.size(); i++) {
            if (path.empty() || nums[i] >= path.back()) {
                path.push_back(nums[i]);
                backtrack(i + 1, path, nums, result);
                path.pop_back();
            }
        }
    }
};
