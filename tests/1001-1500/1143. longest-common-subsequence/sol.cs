public class Solution {
    public int LongestCommonSubsequence(string text1, string text2) {
        int m = text1.Length;
        int n = text2.Length;
        int[,] memo = new int[m, n];
        for (int i = 0; i < m; i++)
            for (int j = 0; j < n; j++)
                memo[i, j] = -1;

        return Solve(0, 0, text1, text2, memo, m, n);
    }

    private int Solve(int i, int j, string text1, string text2, int[,] memo, int m, int n) {
        if (i >= m || j >= n) return 0;
        if (memo[i, j] != -1) return memo[i, j];

        if (text1[i] == text2[j]) {
            memo[i, j] = 1 + Solve(i + 1, j + 1, text1, text2, memo, m, n);
        } else {
            memo[i, j] = Math.Max(Solve(i + 1, j, text1, text2, memo, m, n),
                                  Solve(i, j + 1, text1, text2, memo, m, n));
        }
        return memo[i, j];
    }
}
