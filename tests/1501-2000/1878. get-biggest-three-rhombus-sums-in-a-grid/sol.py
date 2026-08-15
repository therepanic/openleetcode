diag = [[0] * 51 for _ in range(100)]
antid = [[0] * 51 for _ in range(100)]
OFFSET = 50


class Solution:
    def getBiggestThree(self, grid: List[List[int]]) -> List[int]:
        def rhombusSum(i, j, d):
            if d == 0:
                return grid[i][j]
            l, r, u, b = j - d, j + d, i - d, i + d
            i0, i1 = u - j + OFFSET, i - l + OFFSET
            Sum = diag[i0][r + 1] - diag[i0][j]
            Sum += diag[i1][j + 1] - diag[i1][l]

            j0, j1 = u + j, b + j
            Sum += antid[j0][i] - antid[j0][u + 1]
            Sum += antid[j1][b] - antid[j1][i + 1]
            return Sum

        m, n = len(grid), len(grid[0])
        for i, row in enumerate(grid):
            for j, x in enumerate(row):
                i0, j0 = i - j + OFFSET, i + j
                diag[i0][j + 1] = diag[i0][j] + x
                antid[j0][i + 1] = antid[j0][i] + x

        dM = min(m, n) >> 1
        x = [-1] * 3
        for d in range(dM + 1):
            for i in range(d, m - d):
                for j in range(d, n - d):
                    y = rhombusSum(i, j, d)
                    if y == x[0] or y == x[1] or y == x[2]:
                        continue
                    if y > x[0]:
                        x[2] = x[1]
                        x[1] = x[0]
                        x[0] = y
                    elif y > x[0]:
                        x[2] = x[1]
                        x[1] = x[0]
                        x[0] = y
                    elif y > x[1]:
                        x[2] = x[1]
                        x[1] = y
                    elif y > x[2]:
                        x[2] = y

        for i in range(2, -1, -1):
            if x[i] == -1:
                x.pop()

        return x
