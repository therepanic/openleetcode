class UnionFind:
    def __init__(self, n):
        self.parents = list(range(4 * n * n))

    def find(self, x):
        if x != self.parents[x]:
            self.parents[x] = self.find(self.parents[x])
        return self.parents[x]

    def union(self, x, y):
        x, y = self.find(x), self.find(y)
        if x != y:
            self.parents[x] = y
            return True
        return False


class Solution:
    def regionsBySlashes(self, grid: list[str]) -> int:
        n = len(grid)
        union = UnionFind(n)
        count = 4 * n * n
        merges = {
            " ": [(0, 1), (1, 2), (2, 3)],
            "/": [(0, 3), (1, 2)],
            "\\": [(0, 1), (2, 3)],
        }
        for i in range(n):
            for j in range(n):
                base = (i * n + j) * 4
                for u, v in merges[grid[i][j]]:
                    if union.union(base + u, base + v):
                        count -= 1

                if i + 1 < n:
                    down_base = ((i + 1) * n + j) * 4
                    if union.union(base + 2, down_base):
                        count -= 1

                if j + 1 < n:
                    right_base = ((j + 1) + n * i) * 4
                    if union.union(base + 1, right_base + 3):
                        count -= 1
        return count
