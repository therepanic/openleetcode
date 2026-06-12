public class Solution {
    public int MaxProduct(int[] nums) {
        int best = nums[0];
        int curMax = nums[0];
        int curMin = nums[0];
        for (int i = 1; i < nums.Length; i++) {
            int x = nums[i];
            if (x < 0) {
                int temp = curMax;
                curMax = curMin;
                curMin = temp;
            }
            curMax = System.Math.Max(x, curMax * x);
            curMin = System.Math.Min(x, curMin * x);
            best = System.Math.Max(best, curMax);
        }
        return best;
    }
}
