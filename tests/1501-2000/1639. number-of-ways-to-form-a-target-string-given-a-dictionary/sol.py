class Solution:
    def numWays(self, words: List[str], target: str) -> int:
        mod = 10**9 + 7
        n = len(words)
        m = len(words[0])
        A = [[0] * 26 for _ in range(m)]
        for word in words:
            for j in range(m):
                A[j][ord(word[j]) - ord("a")] += 1

        dp = [[-1] * len(target) for _ in range(m)]

        def F(i: int, j: int) -> int:
            if j == len(target):
                return 1
            if i == len(A):
                return 0
            if dp[i][j] != -1:
                return dp[i][j]

            count = F(i + 1, j)
            count %= mod
            count += (A[i][ord(target[j]) - ord("a")] * F(i + 1, j + 1)) % mod
            count %= mod
            dp[i][j] = count
            return dp[i][j]

        return F(0, 0)
