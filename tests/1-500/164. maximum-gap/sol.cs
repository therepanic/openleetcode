public class Solution {
    public int MaximumGap(int[] nums) {
        if (nums.Length < 2) return 0;
        System.Array.Sort(nums);
        int best = 0;
        for (int i = 1; i < nums.Length; i++) {
            best = System.Math.Max(best, nums[i] - nums[i - 1]);
        }
        return best;
    }
}
