class Solution:
    def restoreArray(self, adjacentPairs):
        from collections import defaultdict

        xorMap = defaultdict(int)
        degree = defaultdict(int)

        for u, v in adjacentPairs:
            xorMap[u] ^= v
            xorMap[v] ^= u
            degree[u] += 1
            degree[v] += 1

        # find endpoint
        start = 0
        for k in degree:
            if degree[k] == 1:
                start = k
                break

        n = len(adjacentPairs) + 1
        res = [0] * n

        res[0] = start
        prev = 0

        for i in range(1, n):
            res[i] = xorMap[res[i - 1]] ^ prev
            prev = res[i - 1]

        return res
