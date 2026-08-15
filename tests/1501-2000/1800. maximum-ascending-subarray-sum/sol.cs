public class Solution {
    public int MaxAscendingSum(int[] nums) {
        int curr = nums[0], ans = nums[0];
        for (int i = 1; i < nums.Length; i++) {
            curr = nums[i] > nums[i-1] ? curr + nums[i] : nums[i];
            ans = Math.Max(ans, curr);
        }
        return ans;
    }
}
