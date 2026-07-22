class Solution:
    MOD = 10**9 + 7

    def sieve():
        prime = [False, False] + [True] * 99
        for i in range(2, int(100**0.5) + 1):
            if prime[i]:
                for j in range(i * i, 101, i):
                    prime[j] = False
        return prime

    def build_prefix(prime):
        prefix = [0] * 101
        for i in range(2, 101):
            prefix[i] = prefix[i - 1] + (1 if prime[i] else 0)
        return prefix

    is_prime = sieve()
    prefix_prime = build_prefix(is_prime)

    @staticmethod
    def numPrimeArrangements(n):
        x = Solution.prefix_prime[n]
        y = n - x
        proX = proY = 1

        for i in range(2, x + 1):
            proX = (proX * i) % Solution.MOD
        for i in range(2, y + 1):
            proY = (proY * i) % Solution.MOD

        return (proX * proY) % Solution.MOD
