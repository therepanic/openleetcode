class Solution {
public:
    int minimumSize(vector<int>& nums, int maxOperations) {
        int lo = 1, hi = *max_element(nums.begin(), nums.end());
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            long long needed = 0;
            for (int x : nums) {
                needed += (x - 1) / mid;
            }
            if (needed <= maxOperations) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        return lo;
    }
};
