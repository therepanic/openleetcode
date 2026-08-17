class Solution {
    public int maximumScore(int[] nums, int k) {
        int n = nums.length;
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
            curMin = Math.min(curMin, Math.min(nums[i], nums[j]));
            res = Math.max(res, curMin * (j - i + 1));
        }

        return res;
    }
}
