class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)
        # Initialize an m x n grid with -1
        memo = [[-1] * n for _ in range(m)]

        def solve(i, j):
            # Base case: Out of bounds
            if i >= m or j >= n:
                return 0

            # Return cached result
            if memo[i][j] != -1:
                return memo[i][j]

            # Characters match: Move both pointers
            if text1[i] == text2[j]:
                memo[i][j] = 1 + solve(i + 1, j + 1)
            # Characters differ: Branch out and find the max
            else:
                memo[i][j] = max(solve(i + 1, j), solve(i, j + 1))

            return memo[i][j]

        return solve(0, 0)
