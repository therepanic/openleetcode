class Solution {
public:
    int maximumScore(vector<int>& nums, int k) {
        int n = nums.size();
        int i = k, j = k;
        int curMin = nums[k];
        int res = curMin;

        while (i > 0 || j < n - 1) {
            if (i == 0) {
                j++;
            } else if (j == n - 1) {
                i--;
            } else if (nums[i - 1] >= nums[j + 1]) {
                i--;
            } else {
                j++;
            }
            curMin = min({curMin, nums[i], nums[j]});
            res = max(res, curMin * (j - i + 1));
        }

        return res;
    }
};
