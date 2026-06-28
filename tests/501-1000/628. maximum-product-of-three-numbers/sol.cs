public class Solution {
    public int MaximumProduct(int[] nums) {
        Array.Sort(nums);
        int n = nums.Length;
        return Math.Max(nums[n-1] * nums[n-2] * nums[n-3], nums[n-1] * nums[0] * nums[1]);
    }
}
