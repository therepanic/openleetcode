from collections import deque


class Solution:
    def containsCycle(self, grid):
        n = len(grid)
        m = len(grid[0])

        visited = [[False] * m for _ in range(n)]

        def bfs(i, j):
            queue = deque()
            queue.append((i, j, -1, -1))  # (x, y, parent_x, parent_y)
            visited[i][j] = True

            directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

            while queue:
                x, y, px, py = queue.popleft()

                for dx, dy in directions:
                    nx, ny = x + dx, y + dy

                    # boundary check
                    if nx < 0 or ny < 0 or nx >= n or ny >= m:
                        continue

                    # same character condition
                    if grid[nx][ny] != grid[x][y]:
                        continue

                    # skip parent
                    if nx == px and ny == py:
                        continue

                    # cycle detected
                    if visited[nx][ny]:
                        return True

                    visited[nx][ny] = True
                    queue.append((nx, ny, x, y))

            return False

        for i in range(n):
            for j in range(m):
                if not visited[i][j]:
                    if bfs(i, j):
                        return True

        return False
