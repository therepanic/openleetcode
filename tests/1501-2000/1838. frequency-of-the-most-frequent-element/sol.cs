public class Solution {
    public int MaxFrequency(int[] nums, int k) {
        Array.Sort(nums);
        int left = 0, right = 0, res = 0;
        long total = 0;

        while (right < nums.Length) {
            total += nums[right];

            while ((long)nums[right] * (right - left + 1) > total + k) {
                total -= nums[left];
                left++;
            }
            
            res = Math.Max(res, right - left + 1);
            right++;
        }
        
        return res;
    }
}
