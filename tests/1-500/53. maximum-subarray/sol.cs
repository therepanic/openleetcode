public class Solution {
    public int MaxSubArray(int[] nums) {
        int best = nums[0];
        int cur = 0;
        foreach (int n in nums) {
            if (cur < 0) {
                cur = 0;
            }
            cur += n;
            if (cur > best) {
                best = cur;
            }
        }
        return best;
    }
}
