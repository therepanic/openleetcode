class Solution:
    def largestIsland(self, grid: List[List[int]]) -> int:

        r, c = len(grid), len(grid[0])
        dir = {(1, 0), (0, 1), (-1, 0), (0, -1)}
        island = 2

        def dfs(i, j, x):
            tot = 1
            grid[i][j] = x
            for dx, dy in dir:
                nx, ny = i + dx, j + dy
                if 0 <= nx < r and 0 <= ny < c and grid[nx][ny] == 1:
                    tot += dfs(nx, ny, x)
            return tot

        a = defaultdict(int)
        for i in range(r):
            for j in range(c):
                if grid[i][j] == 1:
                    a[island] = dfs(i, j, island)
                    island += 1

        res = 0
        for i in range(r):
            for j in range(c):
                if grid[i][j] == 0:
                    y = set()
                    for dx, dy in dir:
                        nx, ny = i + dx, j + dy
                        if 0 <= nx < r and 0 <= ny < c and grid[nx][ny] != 0:
                            y.add(grid[nx][ny])
                    tot = 1
                    for b in list(y):
                        tot += a[b]
                    res = max(res, tot)

        return max(res, a[2])
