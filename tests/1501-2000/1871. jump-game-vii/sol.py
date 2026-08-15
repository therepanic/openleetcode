class Solution:
    def canReach(self, s: str, minJump: int, maxJump: int) -> bool:
        n = len(s)
        if s[-1] == "1":
            return False

        dp = [False] * n
        dp[0] = True

        reachable = 0

        for i in range(1, n):
            if i >= minJump and dp[i - minJump]:
                reachable += 1

            if i > maxJump and dp[i - maxJump - 1]:
                reachable -= 1

            if reachable > 0 and s[i] == "0":
                dp[i] = True

        return dp[-1]
