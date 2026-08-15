class Solution:
    def minSkips(self, dist, speed, hoursBefore):
        inf = 10**30
        dp = [inf] * (len(dist) + 1)
        dp[0] = 0
        for i, d in enumerate(dist):
            nxt = [inf] * (len(dist) + 1)
            for skips in range(i + 2):
                if dp[skips] >= inf:
                    continue
                nxt[skips + 1] = min(nxt[skips + 1], dp[skips] + d)
                arrival = dp[skips] + d
                if i != len(dist) - 1:
                    arrival = ((arrival + speed - 1) // speed) * speed
                nxt[skips] = min(nxt[skips], arrival)
            dp = nxt
        limit = hoursBefore * speed
        for skips, arrival in enumerate(dp):
            if arrival <= limit:
                return skips
        return -1
