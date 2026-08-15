class Solution(object):
    def largestMagicSquare(self, grid):
        m, n = len(grid), len(grid[0])
        res = 1

        def isValid(i, j, k):
            s = None
            for x in range(i, i + k):
                row = sum(grid[x][j:j + k])
                if s is None: s = row
                elif s != row: return False

            for y in range(j, j + k):
                if sum(grid[x][y] for x in range(i, i + k)) != s:
                    return False

            if sum(grid[i + d][j + d] for d in range(k)) != s:
                return False

            if sum(grid[i + d][j + k - 1 - d] for d in range(k)) != s:
                return False

            return True

        for k in range(2, min(m, n) + 1):
            for i in range(m - k + 1):
                for j in range(n - k + 1):
                    if isValid(i, j, k):
                        res = k
        return res
