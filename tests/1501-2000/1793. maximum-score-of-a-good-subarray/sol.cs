public class Solution {
    public int MaximumScore(int[] nums, int k) {
        int n = nums.Length;
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
            curMin = Math.Min(curMin, Math.Min(nums[i], nums[j]));
            res = Math.Max(res, curMin * (j - i + 1));
        }

        return res;
    }
}
