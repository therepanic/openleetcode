class Solution:
    def rotateGrid(self, grid: List[List[int]], k: int) -> List[List[int]]:
        T, L = 0, 0
        B, R = len(grid) - 1, len(grid[0]) - 1

        while T < B and L < R:
            ln, wid = B - T, R - L
            perimeter = 2 * ln + 2 * wid
            r = k % perimeter

            while r:
                tmp = grid[T][L]

                for i in range(L, R):
                    grid[T][i] = grid[T][i + 1]

                for i in range(T, B):
                    grid[i][R] = grid[i + 1][R]

                for i in range(R, L, -1):
                    grid[B][i] = grid[B][i - 1]

                for i in range(B, T, -1):
                    grid[i][L] = grid[i - 1][L]

                grid[T + 1][L] = tmp
                r -= 1

            T += 1
            L += 1
            B -= 1
            R -= 1

        return grid
