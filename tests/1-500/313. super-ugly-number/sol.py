class Solution(object):
    def nthSuperUglyNumber(self, n, primes):
        ugly = [1] * n
        idx = [0] * len(primes)
        val = primes[:]
        for i in range(1, n):
            m = min(val)
            ugly[i] = m
            for j, p in enumerate(primes):
                if val[j] == m:
                    idx[j] += 1
                    val[j] = ugly[idx[j]] * p
        return ugly[-1]
