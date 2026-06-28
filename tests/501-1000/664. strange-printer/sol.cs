public class Solution {
    public int StrangePrinter(string s) {
        int n = s.Length;
        int[,] memo = new int[n, n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                memo[i, j] = -1;
            }
        }
        return MinTurns(s, 0, n - 1, memo);
    }
    
    private int MinTurns(string s, int start, int end, int[,] memo) {
        if (start > end) {
            return 0;
        }
        
        if (memo[start, end] != -1) {
            return memo[start, end];
        }
        
        int res = MinTurns(s, start, end - 1, memo) + 1;
        
        for (int middle = start; middle < end; middle++) {
            if (s[middle] == s[end]) {
                res = Math.Min(res, MinTurns(s, start, middle, memo) + MinTurns(s, middle + 1, end - 1, memo));
            }
        }
        
        memo[start, end] = res;
        return res;
    }
}
