public class Solution {
    public int WaysToSplit(int[] nums) {
        const int MOD = 1000000007;
        int n = nums.Length;
        long[] prefix = new long[n];
        prefix[0] = nums[0];
        
        for (int i = 1; i < n; i++) {
            prefix[i] = prefix[i - 1] + nums[i];
        }
        
        long res = 0;
        for (int i = 0; i < n - 2; i++) {
            long left = prefix[i];
            int j = LowerBound(prefix, 2 * left, i + 1, n - 1);
            int k = UpperBound(prefix, (prefix[n - 1] + left) / 2, j, n - 1);
            if (j < k) {
                res = (res + (k - j)) % MOD;
            }
        }
        return (int)res;
    }
    
    private int LowerBound(long[] arr, long target, int lo, int hi) {
        int l = lo, h = hi;
        while (l < h) {
            int mid = (l + h) / 2;
            if (arr[mid] < target) {
                l = mid + 1;
            } else {
                h = mid;
            }
        }
        return l;
    }
    
    private int UpperBound(long[] arr, long target, int lo, int hi) {
        int l = lo, h = hi;
        while (l < h) {
            int mid = (l + h) / 2;
            if (arr[mid] <= target) {
                l = mid + 1;
            } else {
                h = mid;
            }
        }
        return l;
    }
}
