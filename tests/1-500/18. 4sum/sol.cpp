class Solution {
public:
    vector<vector<int>> fourSum(vector<int>& nums, int target) {
        sort(nums.begin(), nums.end());
        vector<vector<int>> res;
        int n = (int)nums.size();
        for (int i = 0; i + 3 < n; ++i) {
            if (i > 0 && nums[i] == nums[i - 1]) continue;
            for (int j = i + 1; j + 2 < n; ++j) {
                if (j > i + 1 && nums[j] == nums[j - 1]) continue;
                int l = j + 1, r = n - 1;
                while (l < r) {
                    long long sum = (long long)nums[i] + nums[j] + nums[l] + nums[r];
                    if (sum == target) {
                        res.push_back({nums[i], nums[j], nums[l], nums[r]});
                        ++l; --r;
                        while (l < r && nums[l] == nums[l - 1]) ++l;
                        while (l < r && nums[r] == nums[r + 1]) --r;
                    } else if (sum < target) {
                        ++l;
                    } else {
                        --r;
                    }
                }
            }
        }
        return res;
    }
};
