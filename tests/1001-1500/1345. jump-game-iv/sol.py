from collections import defaultdict, deque
from typing import List


class Solution:
    def minJumps(self, arr: List[int]) -> int:
        n = len(arr)
        if n == 1:
            return 0

        mp = defaultdict(list)
        for i in range(n):
            mp[arr[i]].append(i)

        q = deque([(0, 0)])
        vis = [0] * n
        vis[0] = 1

        while q:
            node, dist = q.popleft()

            if node == n - 1:
                return dist

            if node - 1 >= 0 and not vis[node - 1]:
                vis[node - 1] = 1
                q.append((node - 1, dist + 1))

            if node + 1 < n and not vis[node + 1]:
                vis[node + 1] = 1
                q.append((node + 1, dist + 1))

            for nxt in mp[arr[node]]:
                if not vis[nxt]:
                    vis[nxt] = 1
                    q.append((nxt, dist + 1))

            mp[arr[node]].clear()

        return -1
