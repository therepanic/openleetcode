import 'dart:math' as math;

class Solution {
  bool winnerSquareGame(int n) {
    List<List<int>> memo = List.generate(2, (_) => List.filled(n + 1, -1));
    bool dp(int player, int stones) {
      if (stones == 0) return false;
      if (memo[player][stones] != -1) return memo[player][stones] == 1;
      int sqrt = math.sqrt(stones).toInt();
      for (int i = sqrt; i >= 1; i--) {
        int sq = i * i;
        if (sq == stones || !dp(player ^ 1, stones - sq)) {
          memo[player][stones] = 1;
          return true;
        }
      }
      memo[player][stones] = 0;
      return false;
    }
    return dp(0, n);
  }
}
