class Solution {
    public int nthMagicalNumber(int n, int a, int b) {
        int MOD = 1000000007;
        int g = gcd(a, b);
        long lcm = (long) a / g * b;
        long lo = Math.min(a, b);
        long hi = n * lo;
        while (lo < hi) {
            long mid = (lo + hi) >> 1;
            long cnt = mid / a + mid / b - mid / lcm;
            if (cnt < n) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return (int) (lo % MOD);
    }
    
    private int gcd(int x, int y) {
        while (y != 0) {
            int t = y;
            y = x % y;
            x = t;
        }
        return x;
    }
}
