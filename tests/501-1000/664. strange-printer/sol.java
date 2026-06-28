class Solution {
    public int strangePrinter(String s) {
        int n = s.length();
        Integer[][] memo = new Integer[n][n];
        return minTurns(s, 0, n - 1, memo);
    }
    
    private int minTurns(String s, int start, int end, Integer[][] memo) {
        if (start > end) {
            return 0;
        }
        
        if (memo[start][end] != null) {
            return memo[start][end];
        }
        
        int res = minTurns(s, start, end - 1, memo) + 1;
        
        for (int middle = start; middle < end; middle++) {
            if (s.charAt(middle) == s.charAt(end)) {
                res = Math.min(res, minTurns(s, start, middle, memo) + minTurns(s, middle + 1, end - 1, memo));
            }
        }
        
        memo[start][end] = res;
        return res;
    }
}
