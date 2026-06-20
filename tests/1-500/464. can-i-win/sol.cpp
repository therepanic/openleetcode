class Solution {
public:
    bool canIWin(int maxChoosableInteger, int desiredTotal) {
        if (desiredTotal <= 0) return true;
        int sum = maxChoosableInteger * (maxChoosableInteger + 1) / 2;
        if (sum < desiredTotal) return false;
        
        unordered_map<int, bool> memo;
        
        function<bool(int, int)> canWin = [&](int state, int total) -> bool {
            if (memo.count(state)) return memo[state];
            
            for (int i = 1; i <= maxChoosableInteger; i++) {
                int bit = 1 << (i - 1);
                if ((state & bit) == 0) {
                    if (i >= total || !canWin(state | bit, total - i)) {
                        return memo[state] = true;
                    }
                }
            }
            return memo[state] = false;
        };
        
        return canWin(0, desiredTotal);
    }
};
