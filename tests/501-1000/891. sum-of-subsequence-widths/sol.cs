public class Solution {
    public int SumSubseqWidths(int[] nums) {
        const int mod = 1000000007;
        Array.Sort(nums);
        int n = nums.Length;
        long ans = 0;
        long factor = 1;
        for (int i = 0; i < n; i++) {
            ans = (ans + (nums[i] - nums[n - 1 - i]) * factor) % mod;
            factor = (factor * 2) % mod;
        }
        return (int) ans;
    }
}
