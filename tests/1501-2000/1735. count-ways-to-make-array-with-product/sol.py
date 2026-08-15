import collections
import math


class Solution:
    def waysToFillArray(self, queries: List[List[int]]) -> List[int]:
        def primes(n):
            ret = []
            p = 2
            while p * p <= n:
                while n % p == 0:
                    ret.append(p)
                    n //= p
                p += 1
            if n != 1:
                ret.append(n)
            return ret

        ans = []
        for q in queries:
            a = 1
            prime_count = collections.Counter(primes(q[1]))
            for p, c in prime_count.items():
                a *= math.comb(q[0] + c - 1, q[0] - 1)
            ans.append(a % (10**9 + 7))
        return ans
