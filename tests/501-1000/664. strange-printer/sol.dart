class Solution {
  int strangePrinter(String s) {
    int n = s.length;
    List<List<int?>> memo = List.generate(n, (_) => List.filled(n, null));
    
    int minTurns(int start, int end) {
      if (start > end) {
        return 0;
      }
      
      if (memo[start][end] != null) {
        return memo[start][end]!;
      }
      
      int res = minTurns(start, end - 1) + 1;
      
      for (int middle = start; middle < end; middle++) {
        if (s[middle] == s[end]) {
          int val = minTurns(start, middle) + minTurns(middle + 1, end - 1);
          if (val < res) {
            res = val;
          }
        }
      }
      
      memo[start][end] = res;
      return res;
    }
    
    return minTurns(0, n - 1);
  }
}
