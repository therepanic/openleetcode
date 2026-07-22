class Solution:
    def getMaximumGold(self, grid: List[List[int]]) -> int:
        n = len(grid)
        m = len(grid[0])

        visi = [[False] * m for _ in range(n)]

        direct = [[-1, 0], [0, 1], [1, 0], [0, -1]]

        def dfs(r, c):
            tot = grid[r][c]

            visi[r][c] = True

            curr = 0

            for dr, dc in direct:
                nr, nc = r + dr, c + dc

                if 0 <= nr < n and 0 <= nc < m:
                    if grid[nr][nc] != 0 and visi[nr][nc] == False:
                        a = dfs(nr, nc)
                        curr = max(curr, a)
            tot += curr
            visi[r][c] = False  # BACKTRACKINIG
            return tot

        ans = 0
        for i in range(n):
            for j in range(m):
                if visi[i][j] == False and grid[i][j] != 0:
                    ans = max(ans, dfs(i, j))
        return ans
