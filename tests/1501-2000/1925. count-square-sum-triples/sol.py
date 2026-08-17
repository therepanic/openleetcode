from math import gcd, isqrt


class Solution:
    def countTriples(self, n: int) -> int:
        cnt = 0
        nsqrt = isqrt(n)
        for s in range(2, nsqrt + 1):
            for t in range((s & 1) + 1, s, 2):
                if gcd(s, t) != 1:
                    continue
                c = s * s + t * t
                if c > n:
                    break
                k = n // c
                cnt += 2 * k
        return cnt
