class Solution:
    def maxPoints(self, points: List[List[int]]) -> int:
        m = len(points)
        n = len(points[0])

        dp = points[0][:]

        for r in range(1, m):
            left = [0] * n
            right = [0] * n

            left[0] = dp[0]
            for c in range(1, n):
                left[c] = max(left[c - 1], dp[c] + c)

            right[n - 1] = dp[n - 1] - (n - 1)
            for c in range(n - 2, -1, -1):
                right[c] = max(right[c + 1], dp[c] - c)

            new_dp = [0] * n

            for c in range(n):
                best = max(left[c] - c, right[c] + c)

                new_dp[c] = points[r][c] + best

            dp = new_dp

        return max(dp)
