from typing import List


class DSU:
    def __init__(self, n):
        self.parent = list(range(n))

    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]

    def union(self, a, b):
        pa = self.find(a)
        pb = self.find(b)

        if pa != pb:
            self.parent[pa] = pb


class Solution:
    def minSwapsCouples(self, row: List[int]) -> int:
        n = len(row) // 2  # since number of couples would be rows/2

        dsu = DSU(n)

        for i in range(0, len(row), 2):
            couple1 = row[i] // 2
            couple2 = row[i + 1] // 2

            dsu.union(couple1, couple2)

        component_size = {}

        for couple in range(n):
            root = dsu.find(couple)
            component_size[root] = component_size.get(root, 0) + 1

        swaps = 0

        for size in component_size.values():
            swaps += size - 1

        return swaps
