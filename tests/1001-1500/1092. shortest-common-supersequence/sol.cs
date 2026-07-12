public class Solution {
    public string ShortestCommonSupersequence(string str1, string str2) {
        int m = str1.Length, n = str2.Length;
        int[,] dp = new int[m + 1, n + 1];
        
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                if (str1[i-1] == str2[j-1]) {
                    dp[i, j] = 1 + dp[i-1, j-1];
                } else {
                    dp[i, j] = Math.Max(dp[i-1, j], dp[i, j-1]);
                }
            }
        }
        
        int x = m, y = n;
        var result = new System.Text.StringBuilder();
        
        while (x > 0 && y > 0) {
            if (str1[x-1] == str2[y-1]) {
                result.Append(str1[x-1]);
                x--;
                y--;
            } else if (dp[x-1, y] > dp[x, y-1]) {
                result.Append(str1[x-1]);
                x--;
            } else {
                result.Append(str2[y-1]);
                y--;
            }
        }
        
        while (x > 0) {
            result.Append(str1[x-1]);
            x--;
        }
        
        while (y > 0) {
            result.Append(str2[y-1]);
            y--;
        }
        
        char[] charArray = result.ToString().ToCharArray();
        Array.Reverse(charArray);
        return new string(charArray);
    }
}
