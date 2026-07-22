public class Solution {
    public int NthUglyNumber(int n, int a, int b, int c) {
        long Gcd(long x, long y) {
            while (y != 0) {
                long temp = y;
                y = x % y;
                x = temp;
            }
            return x;
        }
        
        long Lcm(long x, long y) {
            return x * y / Gcd(x, y);
        }
        
        long la = a, lb = b, lc = c;
        long ab = Lcm(la, lb);
        long ac = Lcm(la, lc);
        long bc = Lcm(lb, lc);
        long abc = Lcm(ab, lc);
        
        long left = 1, right = 2_000_000_000;
        
        while (left < right) {
            long mid = left + (right - left) / 2;
            long cnt = mid / la + mid / lb + mid / lc -
                       mid / ab - mid / ac - mid / bc +
                       mid / abc;
            if (cnt >= n) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        
        return (int) left;
    }
}
