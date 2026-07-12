from collections import deque
from typing import List


class Solution:
    def orangesRotting(self, grid):
        n, m = len(grid), len(grid[0])
        q = deque()
        fresh = 0

        # 1. Add rotten oranges & count fresh
        for i in range(n):
            for j in range(m):
                if grid[i][j] == 2:
                    q.append((i, j, 0))
                if grid[i][j] == 1:
                    fresh += 1

        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        max_time, rotten = 0, 0

        # 2. BFS
        while q:
            r, c, t = q.popleft()
            max_time = max(max_time, t)

            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                if 0 <= nr < n and 0 <= nc < m and grid[nr][nc] == 1:
                    grid[nr][nc] = 2
                    q.append((nr, nc, t + 1))
                    rotten += 1

        # 3. Check if all fresh rotted
        return max_time if rotten == fresh else -1
