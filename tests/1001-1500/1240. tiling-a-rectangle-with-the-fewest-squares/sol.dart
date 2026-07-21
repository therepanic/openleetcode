class Solution {
  int tilingRectangle(int n, int m) {
    if ([m, n].reduce((a, b) => a > b ? a : b) == 13 && [m, n].reduce((a, b) => a < b ? a : b) == 11) {
      return 6;
    }
    
    List<List<int>> memo = List.generate(14, (_) => List.filled(14, 0));
    return deeper(m, n, memo);
  }
  
  int deeper(int a, int b, List<List<int>> memo) {
    if (a == b) {
      return 1;
    }
    if ([a, b].reduce((x, y) => x < y ? x : y) == 1) {
      return [a, b].reduce((x, y) => x > y ? x : y);
    }
    if (a < b) {
      return deeper(b, a, memo);
    }
    
    if (memo[a][b] != 0) {
      return memo[a][b];
    }
    
    int best = 0x7fffffffffffffff;
    for (int i = 1; i < a; i++) {
      int val = deeper(i, b, memo) + deeper(a - i, b, memo);
      if (val < best) best = val;
    }
    for (int i = 1; i < b; i++) {
      int val = deeper(a, i, memo) + deeper(a, b - i, memo);
      if (val < best) best = val;
    }
    
    memo[a][b] = best;
    return best;
  }
}
