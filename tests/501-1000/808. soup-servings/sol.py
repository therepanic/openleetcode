from functools import lru_cache
import math


class Solution:
    def soupServings(self, n: int) -> float:
        if n > 5000:
            return 1.0
        units = math.ceil(n / 25)

        @lru_cache(None)
        def calc_prob(soupA, soupB):
            if soupA <= 0 and soupB <= 0:
                return 0.5
            if soupA <= 0:
                return 1.0
            if soupB <= 0:
                return 0.0
            return 0.25 * (
                calc_prob(soupA - 4, soupB)
                + calc_prob(soupA - 3, soupB - 1)
                + calc_prob(soupA - 2, soupB - 2)
                + calc_prob(soupA - 1, soupB - 3)
            )

        return calc_prob(units, units)
