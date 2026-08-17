from math import gcd
from functools import cache


class Solution:
    def maxScore(self, nums: List[int]) -> int:
        """
        maximise Score After N operations
        select two elements for nums and get a score of i*(gcd(x,y))

        Observations
        so -> keep the gcd(x,y) -> of the higher ones for last
        """
        n = len(nums)

        @cache
        def dp(op, mask):
            if mask == (1 << n) - 1:
                # all are selected
                return 0
            ans = 0
            for i in range(n):
                if mask & (1 << i) == 0:
                    for j in range(n):
                        if j != i and mask & (1 << j) == 0:
                            ans = max(
                                ans,
                                dp(op + 1, (mask | (1 << i) | (1 << j)))
                                + (gcd(nums[i], nums[j]) * (op)),
                            )
            return ans

        return dp(1, 0)
