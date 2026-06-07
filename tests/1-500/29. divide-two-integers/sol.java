class Solution {
    public int divide(int dividend, int divisor) {
        if (dividend == Integer.MIN_VALUE && divisor == -1) return Integer.MAX_VALUE;
        long q = (long) dividend / (long) divisor;
        if (q < Integer.MIN_VALUE) return Integer.MIN_VALUE;
        if (q > Integer.MAX_VALUE) return Integer.MAX_VALUE;
        return (int) q;
    }
}
