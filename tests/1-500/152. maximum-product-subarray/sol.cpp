class Solution {
public:
    int maxProduct(vector<int>& nums) {
        int best = nums[0];
        int curMax = nums[0];
        int curMin = nums[0];
        for (int i = 1; i < (int)nums.size(); ++i) {
            int x = nums[i];
            if (x < 0) swap(curMax, curMin);
            curMax = max(x, curMax * x);
            curMin = min(x, curMin * x);
            best = max(best, curMax);
        }
        return best;
    }
};
