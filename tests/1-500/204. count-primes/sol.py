class Solution(object):
    def countPrimes(self, n):
        if n < 2:
            return 0

        sieve = [True] * n
        sieve[0] = sieve[1] = False

        i = 2
        while i * i < n:
            if sieve[i]:
                for j in range(i * i, n, i):
                    sieve[j] = False
            i += 1

        return sum(sieve)
