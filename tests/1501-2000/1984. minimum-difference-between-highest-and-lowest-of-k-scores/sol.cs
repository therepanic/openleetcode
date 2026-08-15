public class Solution {
    public int MinimumDifference(int[] nums, int k) {
        Array.Sort(nums);
        int n = nums.Length;
        int ans = nums[k - 1] - nums[0];
        for (int i = 0; i <= n - k; i++) {
            ans = Math.Min(ans, nums[i + k - 1] - nums[i]);
        }
        return ans;
    }
}
