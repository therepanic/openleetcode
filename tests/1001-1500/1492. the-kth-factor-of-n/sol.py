class Solution:
    def kthFactor(self, n: int, k: int) -> int:
        ab = []
        for i in range(1, n + 1):
            if n % i == 0:
                ab.append(i)
            else:
                continue
        if len(ab) < k:
            return -1
        else:
            return ab[k - 1]
