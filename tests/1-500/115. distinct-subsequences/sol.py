class Solution:
    def numDistinct(self, s: str, t: str) -> int:
        if len(t) > len(s):
            return 0

        memo = {}

        def dfs(i, j):
            if i == len(s) or j == len(t) or len(s) - i < len(t) - j:
                return int(j == len(t))
            if (i, j) in memo:
                return memo[(i, j)]

            ans = dfs(i + 1, j)
            if s[i] == t[j]:
                ans += dfs(i + 1, j + 1)
            memo[(i, j)] = ans
            return ans

        return dfs(0, 0)
