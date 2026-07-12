public class Solution {
    public int NthMagicalNumber(int n, int a, int b) {
        const int mod = 1000000007;
        int g = Gcd(a, b);
        long lcm = (long) a / g * b;
        long lo = Math.Min(a, b);
        long hi = (long) n * lo;
        while (lo < hi) {
            long mid = (lo + hi) >> 1;
            long cnt = mid / a + mid / b - mid / lcm;
            if (cnt < n) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return (int) (lo % mod);
    }
    
    private int Gcd(int x, int y) {
        while (y != 0) {
            int t = y;
            y = x % y;
            x = t;
        }
        return x;
    }
}
