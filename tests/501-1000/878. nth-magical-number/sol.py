from math import gcd


class Solution:
    def nthMagicalNumber(self, n: int, a: int, b: int) -> int:
        MOD = 1000000007

        g = gcd(a, b)
        lcm = a // g * b

        lo, hi = min(a, b), n * min(a, b)

        while lo < hi:
            mid = (lo + hi) >> 1

            cnt = mid // a
            cnt += mid // b
            cnt -= mid // lcm

            if cnt < n:
                lo = mid + 1
            else:
                hi = mid

        return lo % MOD
