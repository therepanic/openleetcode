class Solution(object):
    def highestRankedKItems(self, grid, pricing, start, k):
        """
        :type grid: List[List[int]]
        :type pricing: List[int]
        :type start: List[int]
        :type k: int
        :rtype: List[List[int]]
        """
        m, n = len(grid), len(grid[0])
        low, high = pricing
        sr, sc = start

        q = deque([(sr, sc, 0)])  
        visited = set([(sr, sc)])
        items = []

        directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        while q:
            r, c, dist = q.popleft()
            val = grid[r][c]

            if low <= val <= high:
                items.append((dist, val, r, c))

            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                if 0 <= nr < m and 0 <= nc < n and (nr, nc) not in visited and grid[nr][nc] != 0:
                    visited.add((nr, nc))
                    q.append((nr, nc, dist + 1))

        items.sort()
        return [[r, c] for _, _, r, c in items[:k]]