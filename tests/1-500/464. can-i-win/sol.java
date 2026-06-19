class Solution {
    public boolean canIWin(int maxChoosableInteger, int desiredTotal) {
        if (desiredTotal <= 0) return true;
        int sum = maxChoosableInteger * (maxChoosableInteger + 1) / 2;
        if (sum < desiredTotal) return false;
        
        java.util.Map<Integer, Boolean> memo = new java.util.HashMap<>();
        int state = 0;
        return canWin(state, maxChoosableInteger, desiredTotal, memo);
    }
    
    private boolean canWin(int state, int max, int total, java.util.Map<Integer, Boolean> memo) {
        if (memo.containsKey(state)) return memo.get(state);
        
        for (int i = 1; i <= max; i++) {
            int bit = 1 << (i - 1);
            if ((state & bit) == 0) {
                if (i >= total || !canWin(state | bit, max, total - i, memo)) {
                    memo.put(state, true);
                    return true;
                }
            }
        }
        memo.put(state, false);
        return false;
    }
}
