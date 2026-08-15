from math import gcd


class Solution:
    def countDifferentSubsequenceGCDs(self, nums: List[int]) -> int:
        seen = set(nums)
        maxi = max(nums)
        cnt = 0
        for i in range(1, maxi + 1):
            gd = 0
            for j in range(i, maxi + 1, i):
                if j in seen:
                    gd = gcd(gd, j)
            if gd == i:
                cnt += 1
        return cnt
