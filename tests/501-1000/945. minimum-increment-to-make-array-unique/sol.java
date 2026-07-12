class Solution {
    public int minIncrementForUnique(int[] nums) {
        java.util.Arrays.sort(nums);
        int res = 0;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] <= nums[i - 1]) {
                int target = nums[i - 1] + 1;
                res += target - nums[i];
                nums[i] = target;
            }
        }
        return res;
    }
}
