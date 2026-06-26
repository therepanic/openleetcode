class Solution:
    def dist(self, size, p, t):
        return min(abs(t - p), size - abs(t - p))

    def findRotateSteps(self, ring: str, key: str) -> int:
        mp = [[0] * 100 for _ in range(26)]
        freq = [0] * 26
        dp = [[0] * 100 for _ in range(100)]

        n, m = len(ring), len(key)
        for i in range(n):
            mp[ord(ring[i]) - ord("a")][freq[ord(ring[i]) - ord("a")]] = i
            freq[ord(ring[i]) - ord("a")] += 1

        for i in range(freq[ord(key[0]) - ord("a")]):
            dp[0][mp[ord(key[0]) - ord("a")][i]] = (
                self.dist(n, 0, mp[ord(key[0]) - ord("a")][i]) + 1
            )

        for i in range(1, m):
            for j in range(freq[ord(key[i]) - ord("a")]):
                mini = float("inf")
                for k in range(freq[ord(key[i - 1]) - ord("a")]):
                    mini = min(
                        mini,
                        dp[i - 1][mp[ord(key[i - 1]) - ord("a")][k]]
                        + self.dist(
                            n,
                            mp[ord(key[i]) - ord("a")][j],
                            mp[ord(key[i - 1]) - ord("a")][k],
                        )
                        + 1,
                    )
                dp[i][mp[ord(key[i]) - ord("a")][j]] = mini

        res = float("inf")
        for i in range(freq[ord(key[m - 1]) - ord("a")]):
            res = min(res, dp[m - 1][mp[ord(key[m - 1]) - ord("a")][i]])

        return res
