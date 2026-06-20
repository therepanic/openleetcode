class Solution(object):
    def getMoneyAmount(self, n):
        dp=[[0]*(n+1) for _ in range(n+1)]
        for length in range(2,n+1):
            for start in range(n-length+1,0,-1):
                end=start+length-1
                dp[start][end]=float("inf")
                for pivot in range(start,end+1):
                    left=dp[start][pivot-1] if pivot>start else 0
                    right=dp[pivot+1][end] if pivot<end else 0
                    dp[start][end]=min(dp[start][end],pivot+max(left,right))
        return dp[1][n]
