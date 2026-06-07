class Solution(object):
    def numTrees(self, n):
        dp = [0] * (n + 1)
        dp[0] = 1
        dp[1] = 1

        for nodes in range(2, n + 1):
            total = 0
            for root in range(1, nodes + 1):
                total += dp[root - 1] * dp[nodes - root]
            dp[nodes] = total

        return dp[n]
