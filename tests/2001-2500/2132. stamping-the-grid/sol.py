class Solution:
    def possibleToStamp(self, grid: List[List[int]], stampHeight: int, stampWidth: int) -> bool:
        m, n = len(grid),len(grid[0])
        H,W = stampHeight,stampWidth

        # Build Prefix sums
        ps = [[0] * (n+1) for _ in range(m+1)]
        for i in range(m):
            for j in range(n):
                ps[i+1][j+1] = ps[i][j+1] + ps[i+1][j] - ps[i][j] + grid[i][j]

                # Difference Array
        diff = [[0] * (n+1) for _ in range(m+1)]
        for i in range(m - H + 1):
            for j in range(n - W + 1):
                total = ps[i+H][j + W] - ps[i][j + W] - ps[i + H][j] + ps[i][j]
                if total == 0:
                    diff[i][j] += 1
                    diff[i+H][j] -= 1
                    diff[i][j+W] -= 1
                    diff[i+H][j+W] += 1
        #  Reconstruct coverage
        for i in range(m):
            for j in range(n):
                if i > 0: diff[i][j] += diff[i-1][j]
                if j > 0: diff[i][j] += diff[i][j-1]
                if i > 0 and j > 0: diff[i][j] -= diff[i-1][j-1]

        #  Check validity
        for i in range(m):
            for j in range(n):
                if grid[i][j] == 0 and diff[i][j] <= 0:
                    return False
        return True