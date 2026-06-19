class Solution {
    public int integerReplacement(int n) {
        return helper((long)n, 0);
    }
    
    private int helper(long x, int c) {
        if (x == 1) return c;
        if (x % 2 == 0) {
            return helper(x >> 1, c + 1);
        } else {
            if (x == 3 || ((x >> 1) & 1) == 0) {
                return helper(x - 1, c + 1);
            } else {
                return helper(x + 1, c + 1);
            }
        }
    }
}
