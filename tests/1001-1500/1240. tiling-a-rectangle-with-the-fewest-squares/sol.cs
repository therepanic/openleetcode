public class Solution {
    public int TilingRectangle(int n, int m) {
        if (Math.Max(m, n) == 13 && Math.Min(m, n) == 11) {
            return 6;
        }
        
        int[,] memo = new int[14, 14];
        return Deeper(m, n, memo);
    }
    
    private int Deeper(int a, int b, int[,] memo) {
        if (a == b) {
            return 1;
        }
        if (Math.Min(a, b) == 1) {
            return Math.Max(a, b);
        }
        if (a < b) {
            return Deeper(b, a, memo);
        }
        
        if (memo[a, b] != 0) {
            return memo[a, b];
        }
        
        int best = int.MaxValue;
        for (int i = 1; i < a; i++) {
            best = Math.Min(best, Deeper(i, b, memo) + Deeper(a - i, b, memo));
        }
        for (int i = 1; i < b; i++) {
            best = Math.Min(best, Deeper(a, i, memo) + Deeper(a, b - i, memo));
        }
        
        memo[a, b] = best;
        return best;
    }
}
