public class Solution {
    public int LongestSubarray(int[] nums) {
        int left = 0, zeros = 0, res = 0;
        for (int right = 0; right < nums.Length; right++) {
            if (nums[right] == 0) zeros++;
            while (zeros > 1) {
                if (nums[left] == 0) zeros--;
                left++;
            }
            res = Math.Max(res, right - left);
        }
        return res;
    }
}
