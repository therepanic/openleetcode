import heapq
from typing import List


class Solution:
    def networkDelayTime(self, times: List[List[int]], n: int, k: int) -> int:

        adj = [[] for _ in range(n + 1)]

        for u, v, w in times:
            adj[u].append((v, w))

        dist = [float("inf")] * (n + 1)
        dist[k] = 0

        pq = [(0, k)]

        while pq:
            dis, node = heapq.heappop(pq)

            if dis > dist[node]:
                continue

            for adjNode, wt in adj[node]:
                if dis + wt < dist[adjNode]:
                    dist[adjNode] = dis + wt
                    heapq.heappush(pq, (dist[adjNode], adjNode))

        ans = 0

        for i in range(1, n + 1):
            if dist[i] == float("inf"):
                return -1

            ans = max(ans, dist[i])

        return ans
