class Solution:
    def hammingWeight(self, n: int) -> int:
        res = 0

        for i in range(32):
            if (n >> i) & 1:
                res += 1

        return res
