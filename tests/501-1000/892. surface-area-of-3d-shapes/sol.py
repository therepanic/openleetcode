class Solution:
    def surfaceArea(self, grid: list[list[int]]) -> int:
        n = len(grid)
        area = 0
        for i in range(n):
            for j in range(n):
                if grid[i][j]:
                    # Base area for each stack
                    area += grid[i][j] * 6
                    # Remove internal vertical faces
                    area -= (grid[i][j] - 1) * 2

                    # Subtract adjacent faces(right and down)
                    if i + 1 < n:
                        area -= 2 * min(grid[i][j], grid[i + 1][j])
                    if j + 1 < n:
                        area -= 2 * min(grid[i][j], grid[i][j + 1])
        return area
