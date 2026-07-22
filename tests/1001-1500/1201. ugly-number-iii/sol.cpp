class Solution {
public:
    int nthUglyNumber(int n, int a, int b, int c) {
        auto gcd = [](long long x, long long y) -> long long {
            while (y) {
                long long temp = y;
                y = x % y;
                x = temp;
            }
            return x;
        };
        
        auto lcm = [&](long long x, long long y) -> long long {
            return x * y / gcd(x, y);
        };
        
        long long la = a, lb = b, lc = c;
        long long ab = lcm(la, lb);
        long long ac = lcm(la, lc);
        long long bc = lcm(lb, lc);
        long long abc = lcm(ab, lc);
        
        long long left = 1, right = 2'000'000'000;
        
        while (left < right) {
            long long mid = left + (right - left) / 2;
            long long cnt = mid / la + mid / lb + mid / lc -
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
};
