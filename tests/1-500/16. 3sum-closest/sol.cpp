class Solution {
public:
    int threeSumClosest(vector<int>& nums, int target) {
        sort(nums.begin(), nums.end());
        long long best = (long long)nums[0] + nums[1] + nums[2];
        int n = (int)nums.size();
        for (int i = 0; i + 2 < n; ++i) {
            int l = i + 1, r = n - 1;
            while (l < r) {
                long long sum = (long long)nums[i] + nums[l] + nums[r];
                if (llabs((long long)target - sum) < llabs((long long)target - best)) best = sum;
                if (sum == target) return target;
                if (sum < target) ++l; else --r;
            }
        }
        return (int)best;
    }
};
