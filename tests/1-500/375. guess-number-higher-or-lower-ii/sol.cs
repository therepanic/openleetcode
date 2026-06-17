public class Solution {
    public int GetMoneyAmount(int n) {
        int[,] dp = new int[n + 1, n + 1];
        for (int length = 2; length <= n; length++) {
            for (int start = n - length + 1; start >= 1; start--) {
                int end = start + length - 1;
                dp[start, end] = int.MaxValue;
                for (int pivot = start; pivot <= end; pivot++) {
                    int left = pivot > start ? dp[start, pivot - 1] : 0;
                    int right = pivot < end ? dp[pivot + 1, end] : 0;
                    dp[start, end] = Math.Min(dp[start, end], pivot + Math.Max(left, right));
                }
            }
        }
        return dp[1, n];
    }
}
