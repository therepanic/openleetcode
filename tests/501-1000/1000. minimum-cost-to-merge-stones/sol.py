from functools import lru_cache
from typing import List


class Solution:
    def mergeStones(self, stones: List[int], k: int) -> int:
        n = len(stones)
        if (n - 1) % (k - 1) != 0:
            return -1

        prefix_sums = [0] * (n + 1)
        for i, stone in enumerate(stones, 1):
            prefix_sums[i] = prefix_sums[i - 1] + stone

        @lru_cache(None)
        def optimize(i, j, p):
            """
            i, j: Interval bounds
            p: Target number of piles to reduce to
            """
            # Base Case: Single element can only be 1 pile
            if i == j:
                return 0 if p == 1 else float("inf")

            # Target = 1: Collapse the K-way partition into one
            if p == 1:
                return optimize(i, j, k) + int(prefix_sums[j + 1] - prefix_sums[i])

            # Target > 1: Split the interval into (1) pile and (p-1) piles
            # We step by (k-1) to ensure the first split is always "mergeable"
            res = float("inf")
            for m in range(i, j, k - 1):
                res = min(res, optimize(i, m, 1) + optimize(m + 1, j, p - 1))
            return res

        result = optimize(0, n - 1, 1)
        return int(result) if result != float("inf") else -1
