class Solution(object):
    def largestPathValue(self, colors, edges):
        INF = float("inf")
        n = len(colors)
        adj = defaultdict(list)
        for u, v in edges:
            adj[u].append(v)

        count = [[0] * 26 for _ in range(n)]
        vis = [0] * n

        def dfs(node):
            if vis[node] == 1:
                return INF
            if vis[node] == 2:
                return count[node][ord(colors[node]) - ord("a")]

            vis[node] = 1
            for nxt in adj[node]:
                res = dfs(nxt)
                if res == INF:
                    return INF
                for c in range(26):
                    count[node][c] = max(count[node][c], count[nxt][c])

            col = ord(colors[node]) - ord("a")
            count[node][col] += 1
            vis[node] = 2

            return count[node][col]

        ans = 0
        for i in range(n):
            val = dfs(i)
            if val == INF:
                return -1
            ans = max(ans, val)

        return ans
