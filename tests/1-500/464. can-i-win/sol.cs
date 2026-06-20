public class Solution {
    public bool CanIWin(int maxChoosableInteger, int desiredTotal) {
        if (desiredTotal <= 0) return true;
        int sum = maxChoosableInteger * (maxChoosableInteger + 1) / 2;
        if (sum < desiredTotal) return false;
        
        var memo = new Dictionary<int, bool>();
        
        bool CanWin(int state, int total) {
            if (memo.ContainsKey(state)) return memo[state];
            
            for (int i = 1; i <= maxChoosableInteger; i++) {
                int bit = 1 << (i - 1);
                if ((state & bit) == 0) {
                    if (i >= total || !CanWin(state | bit, total - i)) {
                        memo[state] = true;
                        return true;
                    }
                }
            }
            memo[state] = false;
            return false;
        }
        
        return CanWin(0, desiredTotal);
    }
}
