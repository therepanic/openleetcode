from itertools import product
from typing import List


class Solution:
    def uniquePathsIII(self, grid: List[List[int]]) -> int:
        m, n = len(grid), len(grid[0])

        # iterate through the grid to get relevant info
        sx = sy = -1  # to store starting point
        count = 0  # to count number of squares to walk over
        for i, j in product(range(m), range(n)):
            count += grid[i][j] == 0
            if grid[i][j] == 1:
                sx, sy = i, j

        def backtrack(i: int, j: int, count: int) -> int:
            """
            Backtracking algo to find all valid paths from (i, j) while visiting all non-obstacle cells..
            :param i: Index of row (where top = 0) of coordinate.
            :param j: Index of column (where left = 0) of coordinate.
            :param count: Number of (remaining) non-obstacle cells.
            :returns: Total number of valid paths from (i, j).
            """
            result = 0
            for x, y in ((i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)):
                if not (0 <= x < m and 0 <= y < n):
                    continue
                elif grid[x][y] == 2:
                    # check if all squares have been walked over
                    result += count == 0
                elif grid[x][y] == 0:
                    # traverse down this path
                    grid[x][y] = -1
                    result += backtrack(x, y, count - 1)
                    grid[x][y] = 0  # backtrack and reset
            return result

        # perform DFS + backtracking to find valid paths
        return backtrack(sx, sy, count)
