class Solution:
    def numEnclaves(self, grid: List[List[int]]) -> int:
        total = sum(sum(i) for i in grid)
        print(total)
        q = deque([])
        m, n = len(grid), len(grid[0])
        if m == 1 or n == 1:
            return 0
        seen = set()
        for i in range(n):
            if grid[0][i] == 1:
                q.append((0, i))
                seen.add((0, i))
            if grid[m - 1][i] == 1:
                q.append((m - 1, i))
                seen.add((m - 1, i))
        for i in range(1, m - 1):
            if grid[i][0] == 1:
                q.append((i, 0))
                seen.add((i, 0))
            if grid[i][n - 1] == 1:
                q.append((i, n - 1))
                seen.add((i, n - 1))

        directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        next_total = 0
        while q:
            x, y = q.popleft()

            next_total += 1
            for i, j in directions:
                nx, ny = x - i, y - j
                if (
                    0 <= nx < m
                    and 0 <= ny < n
                    and grid[nx][ny] == 1
                    and (nx, ny) not in seen
                ):
                    q.append((nx, ny))
                    seen.add((nx, ny))
        print(next_total)
        return total - next_total
