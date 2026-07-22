public class Solution {
    public int MinDifference(int[] nums) {
        if (nums.Length <= 3) {
            return 0;
        }
        Array.Sort(nums);
        int n = nums.Length;
        return new int[] {
            nums[n-4] - nums[0],
            nums[n-3] - nums[1],
            nums[n-2] - nums[2],
            nums[n-1] - nums[3]
        }.Min();
    }
}
