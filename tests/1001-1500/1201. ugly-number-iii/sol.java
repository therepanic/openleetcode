class Solution {
    public int nthUglyNumber(int n, int a, int b, int c) {
        long ab = lcm(a, b);
        long ac = lcm(a, c);
        long bc = lcm(b, c);
        long abc = lcm(ab, c);
        
        long left = 1;
        long right = 2_000_000_000L;
        
        while (left < right) {
            long mid = left + (right - left) / 2;
            long cnt = mid / a + mid / b + mid / c 
                     - mid / ab - mid / ac - mid / bc 
                     + mid / abc;
            if (cnt >= n) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        
        return (int) left;
    }
    
    private long gcd(long x, long y) {
        while (y != 0) {
            long temp = y;
            y = x % y;
            x = temp;
        }
        return x;
    }
    
    private long lcm(long x, long y) {
        return x * y / gcd(x, y);
    }
}
