class Solution:
    def maxNiceDivisors(self, primeFactors: int) -> int:
        v = primeFactors
        return (
            1
            if v == 1
            else pow(3, v // 3, 10**9 + 7) * [1, 333333337, 2][v % 3] % (10**9 + 7)
        )
