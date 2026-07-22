from collections import deque


class Solution:
    def shortestPath(self, grid: List[List[int]], k: int) -> int:
        n, m = len(grid), len(grid[0])

        # ============================================================================================================================
        # q = deque()
        # q.append((0, 0,k,0)) #r,c,k,d   #ALWAYS Prefer(d,r,c) rather than (r,c,d)
        q = deque([(0, 0, k, 0)])

        visi = set()
        visi.add((0, 0, k))  # ALWAYS prefer to mark visited while pushing |
        # ⭐️✅ Don'tput (d) in(set tuple)
        # --------------------------------------------------------------------------
        while q:
            r, c, k, d = q.popleft()

            # -----------------------------------------------
            if (r, c) == (n - 1, m - 1):  # REACHED ALREADY ANSWRRR
                return d

            if grid[r][c] == 1:  # IF ITS AN OBSTACLE
                k -= 1  # going through obstacle spend one k

            # -----------------------------------------------
            for dr, dc in [[-1, 0], [0, 1], [1, 0], [0, -1]]:
                nr, nc = r + dr, c + dc

                if 0 <= nr < n and 0 <= nc < m:  # inbounds check
                    if (
                        (nr, nc, k) not in visi
                    ) and k >= 0:  # ONLY FOR Positive remaingin k
                        visi.add(
                            (nr, nc, k)
                        )  # ⭐️✅ Don't put (d+1) also in the (set tuple)
                        q.append((nr, nc, k, d + 1))
            # -----------------------------------------------

        return -1  # last option noting found

    # ============================================================================================================================
