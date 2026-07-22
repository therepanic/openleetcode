class Solution:
    def hasValidPath(self, grid: List[List[int]]) -> bool:
        m, n = len(grid), len(grid[0])

        dir = {
            1: [(0, -1), (0, 1)],
            2: [(-1, 0), (1, 0)],
            3: [(0, -1), (1, 0)],
            4: [(0, 1), (1, 0)],
            5: [(0, -1), (-1, 0)],
            6: [(0, 1), (-1, 0)],
        }

        vis = [[False] * n for _ in range(m)]
        q = deque([(0, 0)])
        vis[0][0] = True

        while q:
            r, c = q.popleft()

            if r == m - 1 and c == n - 1:
                return True

            for dr, dc in dir[grid[r][c]]:
                nr, nc = r + dr, c + dc

                if nr < 0 or nc < 0 or nr >= m or nc >= n or vis[nr][nc]:
                    continue

                for bdr, bdc in dir[grid[nr][nc]]:
                    if nr + bdr == r and nc + bdc == c:
                        vis[nr][nc] = True
                        q.append((nr, nc))

        return False
