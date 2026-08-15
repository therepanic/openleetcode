# posted its solution


class Solution:
    def findFarmland(self, land: List[List[int]]) -> List[List[int]]:
        grid = land
        n = len(grid)
        m = len(grid[0])

        visi = [[False] * m for _ in range(n)]

        direct = [[-1, 0], [0, 1], [1, 0], [0, -1]]

        # NORMAL APPROACH-------------------------------------------------------------------------------------
        def dfs(r, c, temp):
            visi[r][c] = True
            temp.append((r, c))

            for dr, dc in direct:
                nr, nc = r + dr, c + dc
                if 0 <= nr < n and 0 <= nc < m:
                    if visi[nr][nc] == False and grid[nr][nc] == 1:
                        dfs(nr, nc, temp)
            return temp

        # --------------------------------------------
        res = []
        for i in range(n):
            for j in range(m):
                if grid[i][j] == 1 and visi[i][j] == False:
                    temp = dfs(i, j, [])

                    temp.sort()  # O(log(n*m))this temp lenth can be
                    res.append((temp[0][0], temp[0][1], temp[-1][0], temp[-1][1]))

        return res
        # total n*m log(n*m)
        # ==================================================================================================

        # MOST OPTIMAL
        """-------------------------------------------------------------------------------------
        🚀 APPROACH 2: DFS TRACKING BOUNDARIES (Optimal O(N*M))
        1. Top-left corner is always the starting I, J of the DFS.

        2. Bottom-right corner is simply the absolute MAX_R and MAX_C found during traversal.
                    becasue it is siad in question there will be in reectangle shape only
        3. By tracking MAX_COORDS dynamically, we completely avoid appending and sorting, reducing time to pure O(N*M).
        #-------------------------------------------------------------------
        """

        def dfs(r, c, maxr, maxc):
            visi[r][c] = True

            # ⭐ OPTIMIZATION: Just track the absolute max row and col found becasue it is siad in question there will be in reectangle shape only
            maxr = max(maxr, r)
            maxc = max(maxc, r)

            for dr, dc in direct:
                nr, nc = r + dr, c + dc
                if 0 <= nr < n and 0 <= nc < m:
                    if visi[nr][nc] == False and grid[nr][nc] == 1:
                        dfs(nr, nc, maxr, maxc)

        # --------------------------------------------
        res = []
        for i in range(n):
            for j in range(m):
                if grid[i][j] == 1 and visi[i][j] == False:
                    maxr, maxc = i, j  # initially
                    dfs(i, j, maxr, maxc)

                    res.append((i, j, maxr, maxc))

        return res
        # OPTIMAL SOLUTION time: O(N*M))


# ==================================================================================================
