public class Solution {
    public int LenLongestFibSubseq(int[] arr) {
        int n = arr.Length;
        int[,] dp = new int[n, n];
        int maxLen = 0;
        
        for (int curr = 2; curr < n; curr++) {
            int start = 0;
            int end = curr - 1;
            
            while (start < end) {
                int pairSum = arr[start] + arr[end];
                
                if (pairSum > arr[curr]) {
                    end--;
                } else if (pairSum < arr[curr]) {
                    start++;
                } else {
                    dp[end, curr] = dp[start, end] + 1;
                    maxLen = Math.Max(dp[end, curr], maxLen);
                    end--;
                    start++;
                }
            }
        }
        
        return maxLen > 0 ? maxLen + 2 : 0;
    }
}
