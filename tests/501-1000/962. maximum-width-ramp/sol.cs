public class Solution {
    public int MaxWidthRamp(int[] nums) {
        int n = nums.Length;
        int[] right_max = new int[n];
        right_max[n - 1] = nums[n - 1];
        
        for (int i = n - 2; i >= 0; i--) {
            right_max[i] = Math.Max(nums[i], right_max[i + 1]);
        }
        
        int left = 0, right = 0, result = 0;
        while (right < n) {
            if (nums[left] <= right_max[right]) {
                result = Math.Max(result, right - left);
                right++;
            } else {
                left++;
            }
        }
        
        return result;
    }
}
