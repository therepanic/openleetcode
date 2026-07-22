class Solution {
    public int rangeSum(int[] nums, int n, int left, int right) {
        int MOD = 1000000007;
        int size = n * (n + 1) / 2;
        long[] sums = new long[size];
        int idx = 0;
        for (int i = 0; i < n; i++) {
            long total = 0;
            for (int j = i; j < n; j++) {
                total += nums[j];
                sums[idx++] = total;
            }
        }
        Arrays.sort(sums);
        long result = 0;
        for (int i = left - 1; i < right; i++) {
            result = (result + sums[i]) % MOD;
        }
        return (int) result;
    }
}
