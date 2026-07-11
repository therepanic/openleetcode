class Solution(object):
    def maxIncreaseKeepingSkyline(self, grid):
        n = len(grid)
        rowMax = [max(row) for row in grid]
        colMax = [max(grid[r][c] for r in range(n)) for c in range(n)]
        gain = 0
        for r in range(n):
            for c in range(n):
                gain += min(rowMax[r], colMax[c]) - grid[r][c]
        return gain
