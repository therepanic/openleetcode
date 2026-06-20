class Solution {
  bool canIWin(int maxChoosableInteger, int desiredTotal) {
    if (desiredTotal <= 0) return true;
    int sum = maxChoosableInteger * (maxChoosableInteger + 1) ~/ 2;
    if (sum < desiredTotal) return false;
    
    Map<int, bool> memo = {};
    
    bool canWin(int state, int total) {
      if (memo.containsKey(state)) return memo[state]!;
      
      for (int i = 1; i <= maxChoosableInteger; i++) {
        int bit = 1 << (i - 1);
        if ((state & bit) == 0) {
          if (i >= total || !canWin(state | bit, total - i)) {
            memo[state] = true;
            return true;
          }
        }
      }
      memo[state] = false;
      return false;
    }
    
    return canWin(0, desiredTotal);
  }
}
