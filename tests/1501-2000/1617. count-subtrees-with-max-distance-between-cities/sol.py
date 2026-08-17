from collections import deque


class Solution:
    def countSubgraphsForEachDiameter(
        self, n: int, edges: list[list[int]]
    ) -> list[int]:
        def bfs(start):
            d = [-1] * n
            d[start] = 0
            q = deque([start])
            last = start
            while q:
                u = q.popleft()
                last = u
                for v in graph[u]:
                    if ((mask >> v) & 1) and d[v] == -1:
                        d[v] = d[u] + 1
                        q.append(v)
            return last, d[last]

        graph = [[] for _ in range(n)]
        for u, v in edges:
            u -= 1
            v -= 1
            graph[u].append(v)
            graph[v].append(u)
        answer = [0] * (n - 1)
        for mask in range(1, 1 << n):
            if mask & (mask - 1) == 0:
                continue
            b = mask & -mask
            s = b.bit_length() - 1
            vis = 0
            q = deque([s])
            seen = [False] * n
            seen[s] = True
            cnt = 1
            while q:
                u = q.popleft()
                for v in graph[u]:
                    if ((mask >> v) & 1) and not seen[v]:
                        seen[v] = True
                        cnt += 1
                        q.append(v)
            if cnt != mask.bit_count():
                continue
            a, _ = bfs(s)
            _, diam = bfs(a)
            if diam >= 1:
                answer[diam - 1] += 1

        return answer
