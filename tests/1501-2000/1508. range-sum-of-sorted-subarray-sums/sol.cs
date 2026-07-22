public class Solution {
    public int RangeSum(int[] nums, int n, int left, int right) {
        const int MOD = 1000000007;
        var sums = new List<long>();
        for (int i = 0; i < n; i++) {
            long total = 0;
            for (int j = i; j < n; j++) {
                total += nums[j];
                sums.Add(total);
            }
        }
        sums.Sort();
        long result = 0;
        for (int i = left - 1; i < right; i++) {
            result = (result + sums[i]) % MOD;
        }
        return (int)result;
    }
}
