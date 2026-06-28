class Solution:
    def preimageSizeFZF(self, k: int) -> int:
        def trailingZeroes(n: int) -> int:
            return sum(n // (5**i) for i in range(1, 14))

        start = k * 4
        while True:
            H = trailingZeroes(start)
            if H == k:
                return 5
            if H > k:
                break
            start += 1
        return 0
