public class Solution {
    public int MinIncrementForUnique(int[] nums) {
        Array.Sort(nums);
        int res = 0;
        for (int i = 1; i < nums.Length; i++) {
            if (nums[i] <= nums[i - 1]) {
                int target = nums[i - 1] + 1;
                res += target - nums[i];
                nums[i] = target;
            }
        }
        return res;
    }
}
