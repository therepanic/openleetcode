class Solution:
    def countSubIslands(self, grid1: list[list[int]], grid2: list[list[int]]) -> int:
        m, n = len(grid1), len(grid1[0])

        def dfs(i, j):
            if not 0 <= i < m or not 0 <= j < n:
                return
            nonlocal is_valid
            if not grid2[i][j]:
                return
            if not grid1[i][j]:
                is_valid = False
            grid2[i][j] = 0
            for r, c in [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]:
                if 0 <= r < m and 0 <= c < n and grid2[r][c]:
                    dfs(r, c)
            return

        res = 0
        for i in range(m):
            for j in range(n):
                is_valid = True
                if grid2[i][j]:
                    dfs(i, j)
                    if is_valid:
                        res += 1
        return res
