class Solution {
    public int waysToSplit(int[] nums) {
        int MOD = 1_000_000_007;
        int n = nums.length;
        long[] prefix = new long[n];
        prefix[0] = nums[0];
        
        for (int i = 1; i < n; i++) {
            prefix[i] = prefix[i - 1] + nums[i];
        }
        
        long res = 0;
        for (int i = 0; i < n - 2; i++) {
            long left = prefix[i];
            int j = lowerBound(prefix, 2 * left, i + 1, n - 1);
            int k = upperBound(prefix, (prefix[n - 1] + left) / 2, j, n - 1);
            if (j < k) {
                res = (res + (k - j)) % MOD;
            }
        }
        return (int) res;
    }
    
    private int lowerBound(long[] arr, long target, int lo, int hi) {
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (arr[mid] < target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
    
    private int upperBound(long[] arr, long target, int lo, int hi) {
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (arr[mid] <= target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}
