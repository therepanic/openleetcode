public class Solution {
    public int MaxDotProduct(int[] nums1, int[] nums2) {
        int n = nums1.Length, m = nums2.Length;
        int[,] memo = new int[n, m];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                memo[i, j] = int.MinValue;
            }
        }
        
        int Dp(int i, int j) {
            if (i == n || j == m) {
                return int.MinValue;
            }
            if (memo[i, j] != int.MinValue) {
                return memo[i, j];
            }
            
            int take = nums1[i] * nums2[j];
            int res = take;
            int takeAndContinue = Dp(i + 1, j + 1);
            if (takeAndContinue != int.MinValue) {
                res = Math.Max(res, take + takeAndContinue);
            }
            res = Math.Max(res, Dp(i + 1, j));
            res = Math.Max(res, Dp(i, j + 1));
            
            memo[i, j] = res;
            return res;
        }
        
        return Dp(0, 0);
    }
}
