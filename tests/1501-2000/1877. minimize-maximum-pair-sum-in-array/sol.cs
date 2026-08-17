public class Solution {
    public int MinPairSum(int[] nums) {
        Array.Sort(nums);
        int maxSum = 0;
        int l = 0, r = nums.Length - 1;
        while (l < r) {
            maxSum = Math.Max(maxSum, nums[l] + nums[r]);
            l++;
            r--;
        }
        return maxSum;
    }
}
