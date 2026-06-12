from typing import List


class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        dp = triangle[-1][:]
        for row in range(len(triangle) - 2, -1, -1):
            for col in range(len(triangle[row])):
                dp[col] = triangle[row][col] + min(dp[col], dp[col + 1])
        return dp[0]
