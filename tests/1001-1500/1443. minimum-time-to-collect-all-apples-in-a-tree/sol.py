from collections import deque
from typing import List


class Solution:
    def minTime(self, n: int, edges: list[list[int]], hasApple: list[bool]) -> int:
        adj = [[] for _ in range(n)]
        degree = [0] * n

        for u, v in edges:
            adj[u].append(v)
            adj[v].append(u)
            degree[u] += 1
            degree[v] += 1

        q = deque()
        for i in range(1, n):
            if degree[i] == 1 and not hasApple[i]:
                q.append(i)

        keep = [True] * n

        while q:
            u = q.popleft()
            keep[u] = False

            for v in adj[u]:
                degree[v] -= 1
                if v != 0 and keep[v] and not hasApple[v] and degree[v] == 1:
                    q.append(v)

        activeNodes = sum(keep)
        return max(0, (activeNodes - 1) * 2)
