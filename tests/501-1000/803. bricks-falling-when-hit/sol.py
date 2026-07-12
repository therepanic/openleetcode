class UnionFind:
    def __init__(self, n):
        self.parent = list(range(n))  # Initialize parent array
        self.rank = [1] * n  # Initialize rank array

    def find(self, p):
        if p != self.parent[p]:
            self.parent[p] = self.find(self.parent[p])  # Path compression
        return self.parent[p]

    def union(self, p, q):
        root_p, root_q = self.find(p), self.find(q)
        if root_p == root_q:
            return False  # Already in the same set
        if self.rank[root_p] > self.rank[root_q]:
            root_p, root_q = root_q, root_p  # Union by rank
        self.parent[root_p] = root_q
        self.rank[root_q] += self.rank[root_p]
        return True


class Solution:
    def hitBricks(self, grid: List[List[int]], hits: List[List[int]]) -> List[int]:
        m, n = len(grid), len(grid[0])

        seen = set()
        for i, j in hits:
            if grid[i][j]:
                seen.add((i, j))  # Record hit locations
                grid[i][j] = 0  # Simulate initial hits

        uf = UnionFind(m * n + 1)  # Create Union-Find with virtual top row
        for j in range(n):
            if grid[0][j]:
                uf.union(j, m * n)  # Connect top row to virtual top row

        for i in range(m):
            for j in range(n):
                if grid[i][j]:
                    for ii, jj in (i - 1, j), (i, j - 1):
                        if 0 <= ii < m and 0 <= jj < n and grid[ii][jj]:
                            uf.union(i * n + j, ii * n + jj)  # Connect adjacent bricks

        ans = []
        prev_stable = uf.rank[uf.find(m * n)]  # Initial stable bricks

        for i, j in reversed(hits):
            if (i, j) in seen:
                grid[i][j] = 1  # Revert the hit
                if i == 0:
                    uf.union(j, m * n)  # Reconnect to top if on top row
                for ii, jj in (i - 1, j), (i, j - 1), (i, j + 1), (i + 1, j):
                    if 0 <= ii < m and 0 <= jj < n and grid[ii][jj]:
                        uf.union(i * n + j, ii * n + jj)  # Reconnect to neighbors
                curr_stable = uf.rank[uf.find(m * n)]  # Count stable bricks
                ans.append(
                    max(0, curr_stable - prev_stable - 1)
                )  # Calculate fallen bricks
                prev_stable = curr_stable
            else:
                ans.append(0)  # No bricks fall if initially empty

        return ans[::-1]
