public class Solution {
    public int FindMaxConsecutiveOnes(int[] nums) {
        int res = 0;
        int left = 0;
        for (int right = 0; right < nums.Length; right++) {
            if (nums[right] == 0) {
                left = right + 1;
            } else {
                res = Math.Max(res, right - left + 1);
            }
        }
        return res;
    }
}
