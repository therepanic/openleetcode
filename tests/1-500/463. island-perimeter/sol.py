class Solution:
    def islandPerimeter(self, grid: List[List[int]]) -> int:
        rows, cols = len(grid), len(grid[0])
        visited = set()

        start = next(
            (r, c) for r in range(rows) for c in range(cols) if grid[r][c] == 1
        )

        queue = deque([start])
        visited.add(start)
        perimeter = 0

        while queue:
            r, c = queue.popleft()

            for dr, dc in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                nr, nc = r + dr, c + dc

                if not (0 <= nr < rows and 0 <= nc < cols) or grid[nr][nc] == 0:
                    perimeter += 1
                elif (nr, nc) not in visited:
                    visited.add((nr, nc))
                    queue.append((nr, nc))

        return perimeter
