class Solution:
    def maxJumps(self, arr: list[int], d: int) -> int:
        n = len(arr)
        dp = [-1] * n

        def dfs(i):
            if dp[i] != -1:
                return dp[i]

            best = 1

            # Right scan
            for nxt in range(i + 1, min(n, i + d + 1)):
                if arr[nxt] >= arr[i]:
                    break

                best = max(best, 1 + dfs(nxt))

            # Left scan
            for nxt in range(i - 1, max(-1, i - d - 1), -1):
                if arr[nxt] >= arr[i]:
                    break

                best = max(best, 1 + dfs(nxt))

            dp[i] = best
            return dp[i]

        return max(dfs(i) for i in range(n))
