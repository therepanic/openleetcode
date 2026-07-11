class Solution {
    public int sumSubseqWidths(int[] nums) {
        int mod = 1000000007;
        Arrays.sort(nums);
        int n = nums.length;
        long ans = 0;
        long factor = 1;
        for (int i = 0; i < n; i++) {
            ans = (ans + (nums[i] - nums[n - 1 - i]) * factor) % mod;
            factor = (factor * 2) % mod;
        }
        return (int) ans;
    }
}
