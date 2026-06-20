class Solution {
    public int maxRotateFunction(int[] nums) {
        int n = nums.length;
        int totalSum = 0;
        int F = 0;
        for (int i = 0; i < n; i++) {
            totalSum += nums[i];
            F += i * nums[i];
        }
        int result = F;
        for (int k = 1; k < n; k++) {
            F = F + totalSum - n * nums[n - k];
            result = Math.max(result, F);
        }
        return result;
    }
}
