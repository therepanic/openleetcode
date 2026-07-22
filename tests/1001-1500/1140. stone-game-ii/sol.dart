class Solution {
  int stoneGameII(List<int> piles) {
    int n = piles.length;
    List<int> suffix = List.filled(n + 1, 0);
    for (int i = n - 1; i >= 0; i--) {
      suffix[i] = suffix[i + 1] + piles[i];
    }
    List<List<int>> memo = List.generate(n, (_) => List.filled(n + 1, -1));
    
    int best(int i, int m) {
      if (i >= n) return 0;
      if (memo[i][m] != -1) return memo[i][m];
      int answer = 0;
      for (int x = 1; x <= (2 * m).clamp(0, n - i); x++) {
        answer = answer > suffix[i] - best(i + x, m > x ? m : x) 
            ? answer 
            : suffix[i] - best(i + x, m > x ? m : x);
      }
      memo[i][m] = answer;
      return answer;
    }
    
    return best(0, 1);
  }
}
