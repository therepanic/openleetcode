public class Solution {
    public bool WinnerSquareGame(int n) {
        int[][] memo = new int[2][];
        for (int i = 0; i < 2; i++) {
            memo[i] = new int[n + 1];
            System.Array.Fill(memo[i], -1);
        }
        return dp(0, n, memo);
    }
    
    private bool dp(int player, int stones, int[][] memo) {
        if (stones == 0) return false;
        if (memo[player][stones] != -1) return memo[player][stones] == 1;
        int sqrt = (int)System.Math.Sqrt(stones);
        for (int i = sqrt; i >= 1; i--) {
            int sq = i * i;
            if (sq == stones || !dp(player ^ 1, stones - sq, memo)) {
                memo[player][stones] = 1;
                return true;
            }
        }
        memo[player][stones] = 0;
        return false;
    }
}
