class Solution:
    def closedIsland(self, grid: List[List[int]]) -> int:
        m, n = len(grid), len(grid[0])
        res = 0
        for i in range(m):
            for j in range(n):
                if grid[i][j]:
                    continue
                stack = [(i, j)]
                grid[i][j] = 1
                closed = True
                while stack:
                    r, c = stack.pop()
                    if r == 0 or c == 0 or r == m - 1 or c == n - 1:
                        closed = False
                    for dr, dc in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                        nr, nc = r + dr, c + dc
                        if 0 <= nr < m and 0 <= nc < n and grid[nr][nc] == 0:
                            grid[nr][nc] = 1
                            stack.append((nr, nc))
                if closed:
                    res += 1
        return res
