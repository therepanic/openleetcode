class Solution(object):
    def findBall(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: List[int]
        """
        m, n = len(grid), len(grid[0])
        result = []

        for col in range(n):
            current_col = col
            for row in range(m):
                dir = grid[row][current_col]
                next_col = current_col + dir
                if next_col < 0 or next_col >= n or grid[row][next_col] != dir:
                    current_col = -1
                    break
                current_col = next_col
            result.append(current_col)
        return result
