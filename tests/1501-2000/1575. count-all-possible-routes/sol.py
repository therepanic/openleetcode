class Solution:
    MOD = 1000000007

    def countRoutes(self, locations, start, finish, fuel):
        n = len(locations)
        dp = [[0] * (fuel + 1) for _ in range(n)]
        for city in range(n):
            dp[city][0] = 1 if city == finish else 0
        for left in range(1, fuel + 1):
            for city in range(n):
                total = 1 if city == finish else 0
                for nxt in range(n):
                    if nxt != city:
                        cost = abs(locations[nxt] - locations[city])
                        if cost <= left:
                            total = (total + dp[nxt][left - cost]) % self.MOD
                dp[city][left] = total
        return dp[start][fuel]
