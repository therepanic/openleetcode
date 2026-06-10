public class Solution {
    public int Rob(int[] nums) {
        int next1 = 0;
        int next2 = 0;
        for (int i = nums.Length - 1; i >= 0; --i) {
            int curr = System.Math.Max(nums[i] + next2, next1);
            next2 = next1;
            next1 = curr;
        }
        return next1;
    }
}
