class Solution {
    public int waysToMakeFair(int[] nums) {
        int even = 0;
        int odd = 0;
        int even_left = 0;
        int odd_left = 0;
        int result = 0;
        for (int idx = 0; idx < nums.length; idx++) {
            if (idx % 2 == 0) {
                even += nums[idx];
            } else {
                odd += nums[idx];
            }
        }
        for (int idx = 0; idx < nums.length; idx++) {
            if (idx % 2 == 0) {
                even -= nums[idx];
            } else {
                odd -= nums[idx];
            }
            if (even + odd_left == odd + even_left) {
                result++;
            }
            if (idx % 2 == 0) {
                even_left += nums[idx];
            } else {
                odd_left += nums[idx];
            }
        }
        return result;
    }
}
