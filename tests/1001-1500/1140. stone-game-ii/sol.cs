public class Solution {
    public int StoneGameII(int[] piles) {
        int n = piles.Length;
        int[] suffix = new int[n + 1];
        for (int i = n - 1; i >= 0; i--) {
            suffix[i] = suffix[i + 1] + piles[i];
        }
        int[][] memo = new int[n][];
        for (int i = 0; i < n; i++) {
            memo[i] = new int[n + 1];
            Array.Fill(memo[i], -1);
        }
        
        int Best(int i, int m) {
            if (i >= n) return 0;
            if (memo[i][m] != -1) return memo[i][m];
            int answer = 0;
            for (int x = 1; x <= Math.Min(2 * m, n - i); x++) {
                answer = Math.Max(answer, suffix[i] - Best(i + x, Math.Max(m, x)));
            }
            memo[i][m] = answer;
            return answer;
        }
        
        return Best(0, 1);
    }
}
