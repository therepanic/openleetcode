import numpy as np
from functools import lru_cache


class Solution:
    def minCost(self, n: int, cuts: List[int]) -> int:
        # 1. Coordinate Mapping
        # We add the boundaries (0, n) to define the full manifold
        c = sorted(cuts + [0, n])
        m = len(c)

        # 2. Interval Optimization Table
        # We optimize for the minimum cost to process the interval between c[i] and c[j]
        @lru_cache(None)
        def optimize_manifold(i, j):
            # Base Case: No cuts possible between these two coordinates
            if j - i <= 1:
                return 0

            # The "Golden" Search: Find the cut 'k' that minimizes the combined cost
            # We treat the cost as the current stick length: c[j] - c[i]
            res = min(
                optimize_manifold(i, k) + optimize_manifold(k, j)
                for k in range(i + 1, j)
            )

            return res + (c[j] - c[i])

        return optimize_manifold(0, m - 1)
