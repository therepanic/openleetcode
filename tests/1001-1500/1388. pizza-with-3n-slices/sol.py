from typing import List


class Solution:
    def maxSizeSlices(self, slices: List[int]) -> int:
        n = len(slices)  # Total number of slices
        m = n // 3  # Maximum slices we can take

        # Function to perform dynamic programming
        def dp(slices_subset):
            k = len(slices_subset)
            # dp[i][j] = max sum using first i slices with j picks
            dp_table = [[0] * (m + 1) for _ in range(k + 1)]
            for i in range(1, k + 1):
                for j in range(1, min(i, m) + 1):
                    # Choose current slice or skip it
                    take = (dp_table[i - 2][j - 1] if i > 1 else 0) + slices_subset[
                        i - 1
                    ]
                    dp_table[i][j] = max(dp_table[i - 1][j], take)
            return dp_table[k][m]

        # We need to consider two scenarios due to the circular nature:
        # 1. Including the first slice and excluding the last
        # 2. Excluding the first slice and including the last
        return max(dp(slices[:-1]), dp(slices[1:]))
