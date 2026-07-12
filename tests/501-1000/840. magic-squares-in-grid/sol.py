class Solution:
    def isMagicSquare(self, grid, r, c):
        if grid[r + 1][c + 1] != 5:
            return False

        a = grid[r][c]
        b = grid[r][c + 1]
        d = grid[r][c + 2]  # grid ele except centre
        e = grid[r + 1][c]
        f = grid[r + 1][c + 2]
        h = grid[r + 2][c]
        i = grid[r + 2][c + 1]
        j = grid[r + 2][c + 2]

        seen = [False] * 10
        arr = [a, b, d, e, f, h, i, j, 5]
        for x in arr:
            if x < 1 or x > 9 or seen[x]:
                return False
            seen[x] = True

        if a + j != 10:
            return False
        if b + i != 10:
            return False
        if d + h != 10:
            return False
        if e + f != 10:
            return False

        if a + b + d != 15:
            return False
        if h + i + j != 15:
            return False
        if a + e + h != 15:
            return False
        if d + f + j != 15:
            return False
        if a + 5 + j != 15:
            return False
        if d + 5 + h != 15:
            return False

        return True

    def numMagicSquaresInside(self, grid):
        m = len(grid)
        n = len(grid[0])
        c = 0
        for i in range(m - 2):
            for j in range(n - 2):
                if self.isMagicSquare(grid, i, j):
                    c += 1
        return c
