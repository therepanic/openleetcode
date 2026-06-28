public class Solution {
    public int NumSubarrayProductLessThanK(int[] nums, int k) {
        if (k <= 1) {
            return 0;
        }

        int left = 0;
        int product = 1;
        int ans = 0;

        for (int right = 0; right < nums.Length; right++) {
            product *= nums[right];

            while (product >= k) {
                product /= nums[left];
                left++;
            }

            ans += (right - left + 1);
        }

        return ans;
    }
}
