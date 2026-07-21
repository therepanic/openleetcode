class Solution:
    def countServers(self, grid):
        row_counts = [sum(row) for row in grid]
        col_counts = [
            sum(grid[row][col] for row in range(len(grid)))
            for col in range(len(grid[0]))
        ]
        return sum(
            cell
            for row, values in enumerate(grid)
            for col, cell in enumerate(values)
            if cell and (row_counts[row] > 1 or col_counts[col] > 1)
        )
